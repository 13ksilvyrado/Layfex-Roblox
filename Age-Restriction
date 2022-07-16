-- Layfex technologies 2022
local minAge = 5
local kickMsg = "Your account is not old enough to join."


game.Players.PlayerAdded:Connect(function(player)
	if player.AccountAge > minAge then
	else
		player:Kick(kickMsg)
	end
end)
