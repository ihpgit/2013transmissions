local X = 420
local Y = 420

print("Rendering hat")

game:GetService("ContentProvider"):SetBaseUrl("http://www.roblox.com/")
game:GetService("ScriptContext").ScriptsDisabled = true

game:GetObjects("{url}")[1].Parent = workspace

render("{out}", X, Y)
close()
