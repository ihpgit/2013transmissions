local X = 420
local Y = 420

print("Rendering clothes")

game:GetService("ContentProvider"):SetBaseUrl("http://www.roblox.com/")
game:GetService("ScriptContext").ScriptsDisabled = true

local mannequin = game:GetObjects("†¿◙¬Æ╧▀¬µ∆▓╤▀œΩ¤œ╬ß┘Φ╧↨¶")[1]
mannequin.Parent = workspace

game:GetObjects("{url}")[1].Parent = mannequin

render("{out}", X, Y)
close()
