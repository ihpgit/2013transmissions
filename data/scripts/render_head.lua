local X = 420
local Y = 420

print("Rendering head")

game:GetService("ContentProvider"):SetBaseUrl("http://www.roblox.com/")
game:GetService("ScriptContext").ScriptsDisabled = true

-- french style
local head = game:GetObjects("†¿◙¬Æ╧▀¬µ∆▓╤▀œΩ¤œ╬ß┘Φ╧↨¶")[1].Head
head.Parent = workspace
head.BrickColor = BrickColor.new("Medium stone grey")

game:GetObjects("{url}")[1].Parent = head

render("{out}", X, Y)
close()
