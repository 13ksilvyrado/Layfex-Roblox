-- [[ ARSONWARE 2023, CREATE A SCRIPT IN THE GAZNET UI AND PASTE THIS CODE IN THE SCRIPT ]]--
local base = script.Parent
base.Enabled = true

local plr = game.Players.LocalPlayer
local base = script.Parent
local success = base["2"]
local pass = ("replace this text for a password") -- set your password here

base["1"].TextButton.MouseButton1Click:Connect(function()
	if base["1"].TextBox.Text == pass then
		success.Visible = true
		base["1"].Visible = false
		game:GetService("ReplicatedStorage"):WaitForChild("Submit"):FireServer(base["1"])
		wait(5)
		success.Visible = false
	end
end)
