-- Put me in StarterPlayerScripts in roblox studio 

local Player = game.Players.LocalPlayer

repeat wait() until Player.Character


local char = Player.Character
local hum = char:WaitForChild("Humanoid")

local kickmsglist = {
	"Please stop trying to hack our game, thanks.",
	"Stop hacking on a kids game please.",
	"Get better",
	"Skid.",
	"Cheats are not welcome here"
}
local randommsgs = kickmsglist[math.random(1, #kickmsglist)]

hum.StateChanged:Connect(function(oldstate, newstate)
	while true do 
		wait(1)
		if hum.WalkSpeed > 16 or hum.JumpPower == false or hum.MaxHealth > 100 or newstate == Enum.HumanoidStateType.StrafingNoPhysics or newstate == Enum.HumanoidStateType.Flying then
			Player:Kick(randommsgs)
		end
	end
end)
