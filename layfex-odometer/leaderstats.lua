local DataStoreService = game:GetService("DataStoreService")

local playerData = DataStoreService:GetDataStore("PlayerData")

print("Money and Mileage data has loaded!")

local function onPlayerJoin(player)  -- Runs when players join

	local leaderstats = Instance.new("Folder")  --Sets up leaderstats folder

	leaderstats.Name = "leaderstats"

	leaderstats.Parent = player



	local money = Instance.new("IntValue") --Sets up value for leaderstats

	money.Name = "Dollars"

	money.Parent = leaderstats



	local exp = Instance.new("IntValue") --Sets up value for leaderstats

	exp.Name = "Mileage"

	exp.Parent = leaderstats



	local playerUserId = "Player_" .. player.UserId  --Gets player ID

	local data = playerData:GetAsync(playerUserId)  --Checks if player has stored data

	if data then

		money.Value = data['Dollars']

		exp.Value = data['Mileage']

	else

		-- Data store is working, but no current data for this player

		money.Value = 0

		exp.Value = 0

	end

end



local function create_table(player)

	local player_stats = {}

	for _, stat in pairs(player.leaderstats:GetChildren()) do

		player_stats[stat.Name] = stat.Value

	end

	return player_stats

end



local function onPlayerExit(player)  --Runs when players exit



	local player_stats = create_table(player)

	local success, err = pcall(function()

		local playerUserId = "Player_" .. player.UserId

		playerData:SetAsync(playerUserId, player_stats) --Saves player data

	end)



	if not success then

		warn('Could not save data!')

	end

end



game.Players.PlayerAdded:Connect(onPlayerJoin)

game.Players.PlayerRemoving:Connect(onPlayerExit)

-- Author: 13ksilvyrado
