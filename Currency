print("Layfex Economy has loaded!")
local DataStoreService = game:GetService("DataStoreService")
local DollarStore = DataStoreService:GetDataStore("DollarStore")

game.Players.PlayerAdded:Connect(function(player)

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Dollars = Instance.new("IntValue")
	Dollars.Name = "Dollars" -- You can change me to anything but be sure to change the indicated.
	Dollars.Parent = leaderstats



	local UserId = player.UserId

	local data

	local success, errormessage = pcall(function()
		data = DollarStore:GetAsync(UserId)
	end)

	if success then
		Dollars.Value = data -- replace dollars with whatever you want
	end
end)



game.Players.PlayerRemoving:Connect(function(player)
	local UserId = player.UserId
	local data = player.leaderstats.Dollars.Value -- replace dollars with whatever you want

	DollarStore:SetAsync(UserId, data)
end)

--Add me to server scripts
