local player
local Driven = script.Driven
 
script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild('Humanoid') then
		player = game.Players:GetPlayerFromCharacter(hit.Parent)
	end
end)
 
while true do
	Driven.Value = Driven.Value + script.Parent.Velocity.Magnitude
	if Driven.Value > 1609 then
		Driven.Value = 0
		player.leaderstats.Cash.Value = player.leaderstats.Cash.Value + 544
		player.leaderstats.Miles.Value = player.leaderstats.Miles.Value + 1
	end 
	wait(1)
end
-- Money for driving odometer thingy made by AzovWarrior @ Arsonware 2022.
