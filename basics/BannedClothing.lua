-- DISCLAIMER: LATELY I HAVENT BEEN CODING MUCH SIMPLY FOR IRL REASONS SO I DO HIGHLY SUGGEST YOU FIX THIS CODE UR OWN. -- 
local NotAllowed = {7622330017, 7622323261} -- If Clothing exists in here it kicks the player
local Player = game:GetService("Players").LocalPlayer
local Char = Player.Character -- connecting the player
function findBannedClothes(Char) -- the funciton to make it happen
	for _,v in pairs(NotAllowed) do 
		if Char.Player == v then return true
		end
	end
end

game.Players.PlayerAdded:Connect(function(plr) -- the kicking function, self explainatory.
	plr.CharacterAdded:Connect(function(char)
		if findBannedClothes(plr) then
			plr:Kick("You have been kicked for wearing banned clothes.")
			warn("Someone got kicked for wearing banned clothing.")
		end
	end)
end)
