print("This is an official Layfex product! your serial number should be below in the following:")
local SerialNumber = math.random(1, 1000)
wait(60)
print(SerialNumber)
-- \\\ Thanks for using Layfex Admin! if there are any suggestions please leave some in the discussions page of our github repository! -- https://github.com/AzovWarrior711/Layfex-Roblox

-- This requires HTTP to be enabled and you must put this in ServerScriptService!

-- ///

--//Services//
local dataStoreService = game:GetService("DataStoreService")
local banDataStore = dataStoreService:GetDataStore("bans")
local webhookService = require(script.WebhookService)
-----------------------------------------------------------------

--//Variables//
local admins = {INSERT_USER_IDS_HERE}
local adminFolder = game.ReplicatedStorage.Admin
local webhookUrl = "" -- webhookURL here if you want to log commands.
----------------------------------------------------------------------------

--//Settings//
local statsCommandEnabled = false
local logCommands = true
local leaderstatFolderName = "leaderstats"
------------------------------------

--//Admin Check//
game.Players.PlayerAdded:Connect(function(p)
	if table.find(admins, p.UserId) then
		local panel = script.Admin:Clone()
		panel.Parent = p.PlayerGui
	end
end)

----------------------------------------------

--//Ban Check//
game.Players.PlayerAdded:Connect(function(p)
	if banDataStore:GetAsync(p.UserId, true) then
		p:Kick("You're banned, please contact the game owner or admins!")
	end
end)
------------------------------------------------------

--//Kick Main//
adminFolder.Admin.OnServerEvent:Connect(function(player, action, target, reason)
	if action == "Kick" then
		if table.find(admins, player.UserId) then
			game.Players:FindFirstChild(target):Kick("You have been kicked for the following reasons: " .. reason)
			if logCommands == true then
				webhookService:createMessage(webhookUrl, player.Name .. " Kicked: " .. "**"..game.Players:FindFirstChild(target).Name.."**" .. " For: " .. "**"..reason.."**")
			end
		end
	end
end)
---------------------------------------------------------------------------------

--//Ban Main//
adminFolder.Admin.OnServerEvent:Connect(function(player, action, target, reason)
	if action == "Ban" then
		if table.find(admins, player.UserId) then
			banDataStore:SetAsync(game.Players:FindFirstChild(target).UserId, true)
			game.Players:FindFirstChild(target):Kick("You have been banned for the following: " .. reason)
			if logCommands == true then
				webhookService:createMessage(webhookUrl, player.Name .. " Banned: " .. "**"..game.Players:FindFirstChild(target).Name.."**" .. " For: " .. "**"..reason.."**")
			end
		end
	end
end)
------------------------------------------------------------------------------------------

--//Teleport Main//
adminFolder.Admin.OnServerEvent:Connect(function(player, action, target, reason)
	if action == "Tp" then
		if table.find(admins, player.UserId) then
			player.Character:MoveTo(game.Players:FindFirstChild(target).Character.Head.Position)
		end
	end
end)
-----------------------------------------------------------------------------------------------------

--//Bring Main//
adminFolder.Admin.OnServerEvent:Connect(function(player, action, target, reason)
	if action == "Bring" then
		if table.find(admins, player.UserId) then
			game.Players:FindFirstChild(target).Character:MoveTo(player.Character.Head.Position)
		end
	end
end)
-------------------------------------------------------------------------------------------------

--//Freeze Main//
adminFolder.Admin.OnServerEvent:Connect(function(player, action, target, reason)
	if action == "Freeze" then
		if table.find(admins, player.UserId) then
			game.Players:FindFirstChild(target).Character.HumanoidRootPart.Anchored = true
		end
	end
end)
-------------------------------------------------------------------------------------------------

--//Unfreeze Main//
adminFolder.Admin.OnServerEvent:Connect(function(player, action, target, reason)
	if action == "UnFreeze" then
		if table.find(admins, player.UserId) then
			game.Players:FindFirstChild(target).Character.HumanoidRootPart.Anchored = false
		end
	end
end)

--//Stat Main//
adminFolder.Admin.OnServerEvent:Connect(function(player, action, target, reason)
	if action == "Stats" and statsCommandEnabled == true then
		if table.find(admins, player.UserId) then
			for i,v in pairs(game.Players:FindFirstChild(target)[leaderstatFolderName]:GetChildren()) do
				if v:IsA("NumberValue") or v:IsA("IntValue") then
					v.Value = reason
				end
			end
		end
	end
end)
