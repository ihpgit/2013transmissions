local X = 420
local Y = 420

print("Rendering gear")

game:GetService("ContentProvider"):SetBaseUrl("http://www.roblox.com/")
game:GetService("ScriptContext").ScriptsDisabled = true

local gear = game:GetObjects("{url}")
for i,v in pairs(gear) do
	v.Parent = workspace
end

render("{out}", X, Y)
close()
