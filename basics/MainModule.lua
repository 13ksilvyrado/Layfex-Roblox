local module = {}

function module.load(target)
	_G.target = target
	local target = game.Players:WaitForChild(_G.target)
	script.gaznet:Clone().Parent = target.PlayerGui -- replace gaznet with whatever gui you have.
end

return module

--[[ paste this into a mainmodule script in studio. ]]--
