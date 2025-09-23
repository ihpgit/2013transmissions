local X = 420
local Y = 420

print("Rendering bodypart")

game:GetService("ContentProvider"):SetBaseUrl("http://www.roblox.com/")
game:GetService("ScriptContext").ScriptsDisabled = true

local bodyParts = {}

local mannequin = game:GetObjects("†¿◙¬Æ╧▀¬µ∆▓╤▀œΩ¤œ╬ß┘Φ╧↨¶")[1]
mannequin.Parent = workspace

local part = game:GetObjects("{url}")[1]
part.Parent = mannequin
bodyParts[part.BodyPart] = true

if bodyParts[Enum.BodyPart.LeftArm] and bodyParts[Enum.BodyPart.Torso] and bodyParts[Enum.BodyPart.RightArm] then
	game:GetObjects("†¿◙¬Æ╧▀¬µ∆▓╤▀œΩ¤œ╬ß┘Φ╧↨¶")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.LeftArm] and bodyParts[Enum.BodyPart.RightArm] then
	game:GetObjects("†¿◙¬Æ╧▀¬µ∆▓╤▀œΩ¤œ╬ß┘Φ╧↨¶")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.Torso] then
	game:GetObjects("†¿◙¬Æ╧▀¬µ∆▓╤▀œΩ¤œ╬ß┘Φ╧↨¶")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.LeftArm] then
	game:GetObjects("†¿◙¬Æ╧▀¬µ∆▓╤▀œΩ¤œ╬ß┘Φ╧↨¶")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.RightArm] then
	game:GetObjects("†¿◙¬Æ╧▀¬µ∆▓╤▀œΩ¤œ╬ß┘Φ╧↨¶")[1].Parent = mannequin
end

if bodyParts[Enum.BodyPart.LeftLeg] and bodyParts[Enum.BodyPart.RightLeg] then
	game:GetObjects("†¿◙¬Æ╧▀¬µ∆▓╤▀œΩ¤œ╬ß┘Φ╧↨¶")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.LeftLeg] then
	game:GetObjects("†¿◙¬Æ╧▀¬µ∆▓╤▀œΩ¤œ╬ß┘Φ╧↨¶")[1].Parent = mannequin
elseif bodyParts[Enum.BodyPart.RightLeg] then
	game:GetObjects("†¿◙¬Æ╧▀¬µ∆▓╤▀œΩ¤œ╬ß┘Φ╧↨¶")[1].Parent = mannequin
end

render("{out}", X, Y)
close()
