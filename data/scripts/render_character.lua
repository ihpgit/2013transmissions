local X = 600
local Y = 600

print("Rendering character")

game:GetService("ScriptContext").ScriptsDisabled = true 
game:GetService("ContentProvider"):SetBaseUrl("http://www.roblox.com/")

local Player = game:GetService("Players"):CreateLocalPlayer(0)
Player.CharacterAppearance = "{charapp}"
Player:LoadCharacter(false)

if #Player.Character["Right Arm"]:GetChildren() ~= 0 then
	print("Doing tool hack")
	Player.Character.Torso["Right Shoulder"].CurrentAngle = math.rad(90)
end

print("Rendering")
render("{out}", X, Y)
print("Rendered!")
close()
