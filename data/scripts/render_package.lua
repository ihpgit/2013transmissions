local X = 420
local Y = 420

print("Rendering package")

game:GetService("ContentProvider"):SetBaseUrl("http://www.roblox.com/")
game:GetService("ScriptContext").ScriptsDisabled = true

-- {"url"}
local package = {{pkg}}
local bodyParts = {}

local mannequin = game:GetObjects("http://www.roblox.com/asset/?id=1785197&version=6")[1]
mannequin.Parent = workspace

for i,v in pairs(package) do
	local obj = game:GetObjects(v)[1]
	obj.Parent = mannequin

	if obj:IsA("Tool") then
		mannequin.Torso["Right Shoulder"].CurrentAngle = 1.57
	elseif obj:IsA("DataModelMesh") then
		mannequin.Head.Mesh:Remove()
		obj.Parent = mannequin.Head
	elseif obj:IsA("Decal") then
		mannequin.Head.face:Remove()
		obj.Parent = mannequin.Head
	elseif obj:IsA("CharacterMesh") then
		bodyParts[obj.BodyPart] = true
	end
end

if bodyParts[Enum.BodyPart.LeftArm] and bodyParts[Enum.BodyPart.Torso] and bodyParts[Enum.BodyPart.RightArm] then
	game:GetObjects("http://www.roblox.com/asset/?id=27113661")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.LeftArm] and bodyParts[Enum.BodyPart.RightArm] then
	game:GetObjects("http://www.roblox.com/asset/?id=25251042")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.Torso] then
	game:GetObjects("http://www.roblox.com/asset/?id=25251062")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.LeftArm] then
	game:GetObjects("http://www.roblox.com/asset/?id=25251081")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.RightArm] then
	game:GetObjects("http://www.roblox.com/asset/?id=25251071")[1].Parent = mannequin
end

if bodyParts[Enum.BodyPart.LeftLeg] and bodyParts[Enum.BodyPart.RightLeg] then
	game:GetObjects("http://www.roblox.com/asset/?id=25251154")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.LeftLeg] then
	game:GetObjects("http://www.roblox.com/asset/?id=25251138")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.RightLeg] then
	game:GetObjects("http://www.roblox.com/asset/?id=25251144")[1].Parent = mannequin
end

render("{out}", X, Y)
close()
