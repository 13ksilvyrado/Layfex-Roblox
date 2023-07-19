--[[ paste this lines of code in a ModuleScript in roblox studio. ]]--

local module = {}

function module.User(target)
	_G.target = target 
	local target = game.Players:WaitForChild(_G.target)
	script.Chatted:Clone().Parent = target.Character
end

return module
