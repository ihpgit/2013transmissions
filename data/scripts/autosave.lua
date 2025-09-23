if not {enabled} then return end

-- Settings
local ChangesPerPlayer = {changesperplayer} -- Saving also occurs every time the number of edits reaches this number times the number of players
local SaveCheckInterval = {savecheckinterval} -- should be set in seconds, this is how long we wait to force a save, as long as at least one change has been made
local SaveCooldown = {savecooldown} -- At least this many seconds will pass before saving again
local DebugMode = {debug} -- Enables debug prints and modifies existing settings

-- Code
function DelayPrint(message)
	delay(2, function()
		print(message)
	end)
end

local ServerSaveUrl = "http://www.roblox.com/Data/AutoSave.ashx"

local Players = game:GetService("Players")

if DebugMode then
	ChangesPerPlayer = 0
	SaveCheckInterval = 10
	SaveCooldown = 5
end

local ServerSaveCheckSuccess, ServerSaveCheckMessage = pcall(function() return game.ServerSave ~= nil end)
local HasServerSave = ServerSaveCheckSuccess and ServerSaveCheckMessage

if DebugMode then
	if HasServerSave then
		DelayPrint("[Auto Save]: Has server save")
	else
		DelayPrint("[Auto Save]: Does not have server save")
	end
end

local LastSaveTime = 0
local ChangeCount = 0

local SaveModificationAmount = ChangesPerPlayer

local WaitingToSave = false
local TryingToSave = false

local GameRunning = true

function UpdateSaveModificationAmount()
	NumberOfChangesBeforeSaveAbsolute = #Players:GetPlayers() * ChangesPerPlayer
end

function IsArchivable(instance)
	if instance == workspace then
		return true
	elseif not instance.archivable then
		return false
	else
		return IsArchivable(instance.Parent)
	end
end

function DoSave()
	if HasServerSave then
		game:ServerSave()
	else
		game:Save(ServerSaveUrl)
	end
end

function Save()
	if not GameRunning then return end

	if DebugMode then
		print("[Auto Save]: Saving")
	end

	ChangeCount = 0
	LastSaveTime = tick()
	DoSave()
end

function TrySave()
	if TryingToSave then return end
	
	TryingToSave = true

	local now = tick()
	if now - LastSaveTime >= SaveCooldown then
		Save()
	elseif not WaitingToSave then -- Save after cooldown
		WaitingToSave = true
		local cooldown = LastSaveTime + SaveCooldown - now
		delay(cooldown, function()
			Save()
			WaitingToSave = false
		end)
	end

	TryingToSave = false
end

function WorkspaceModification(descendant)
	if IsArchivable(descendant) then
		ChangeCount = ChangeCount + 1
		if ChangeCount >= SaveModificationAmount then
			TrySave()
		end
	end
end

function CheckIfAbleToSave()
	while true do
		wait(SaveCheckInterval)

		if tick() - LastSaveTime >= SaveCheckInterval and ChangeCount > 0 then
			TrySave()
		end
	end
end

function PlayersChanged(player)
	if not player.className == "Player" then return end

	UpdateSaveModificationAmount()
end

function GameClose()
	GameRunning = false

	if DebugMode then
		print("[Auto Save]: Closing save")
	end

	DoSave()
end

--while not game:FindFirstChild("Workspace") do wait(1/30) end
while not workspace do wait(1/30) end

if HasServerSave then
	game:SetServerSaveUrl(ServerSaveUrl)
end

Players.PlayerAdded:connect(PlayersChanged)
Players.PlayerRemoving:connect(PlayersChanged)

for _, player in pairs(Players:GetChildren()) do
	PlayersChild(player)
end

local CloseBindSuccess = pcall(function() game.Close:connect(GameClose) end)
local DescendantCheckSuccess, DescendantCheckMessage = pcall(function() return workspace.DescendantAdded ~= nil end)
local HasDescendantEvents = DescendantCheckSuccess and DescendantCheckMessage

if HasDescendantEvents then
	workspace.DescendantAdded:connect(WorkspaceModification)
	workspace.DescendantRemoving:connect(WorkspaceModification)
else
	local DescendentCheckSuccess, DescendentCheckMessage = pcall(function() return workspace.DescendentAdded ~= nil end)
	local HasDescendentEvents = DescendentCheckSuccess and DescendentCheckMessage

	if HasDescendentEvents then
		workspace.DescendentAdded:connect(WorkspaceModification)
		workspace.DescendentRemoving:connect(WorkspaceModification)
	else
		function HookDescendantEvents(parent)
			parent.ChildAdded:connect(function(child)
				HookDescendantEvents(child)
				WorkspaceModification(child)
			end)
			parent.ChildRemoving:connect(WorkspaceModification)

			for _,v in pairs(parent:GetChildren()) do
				HookDescendantEvents(v)
			end
		end

		HookDescendantEvents(workspace)
	end
end

delay(0, CheckIfAbleToSave)

if DebugMode then
	print("Auto Save has started!")
end
