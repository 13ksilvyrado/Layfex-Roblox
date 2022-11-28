print("Layfex Economy has loaded! your serial number will be stated;")
local SerialNumber = math.random(1, 1000)
wait(5)
print(SerialNumber)
local DataStoreService = game:GetService("DataStoreService")
local DollarStore = DataStoreService:GetDataStore("DollarStore")

game.Players.PlayerAdded:Connect(function(player)

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Dollars = Instance.new("IntValue")
	Dollars.Name = "Dollars"
	Dollars.Parent = leaderstats



	local UserId = player.UserId

	local data

	local success, errormessage = pcall(function()
		data = DollarStore:GetAsync(UserId)
	end)

	if success then
		Dollars.Value = data
	end
end)



game.Players.PlayerRemoving:Connect(function(player)
	local UserId = player.UserId
	local data = player.leaderstats.Dollars.Value

	DollarStore:SetAsync(UserId, data)
end)

--Add me to server scripts
