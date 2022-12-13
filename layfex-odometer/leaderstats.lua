game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
 
	local Cash = Instance.new("IntValue")
	Cash.Name = "Cash"
	Cash.Value = 0
	Cash.Parent = leaderstats
 
	local Miles = Instance.new("IntValue")
	Miles.Name = "Miles"
	Miles.Value = 0
	Miles.Parent = leaderstats
end)
