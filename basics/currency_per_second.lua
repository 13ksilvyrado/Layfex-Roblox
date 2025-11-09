-- // Variables // -- 
local amount = 25 -- amount paid in said seconds
local rq = 30 -- in seconds 
local Currency = "Cash"
-- // the thing that makes it work // --
while true do 
	wait(rq)
	for i, v in pairs(game.Players:GetPlayers()) do 
			if v:FindFirstChild("leaderstats") then
v.leaderstats[Currency].Value = v.leaderstats[Currency].Value + amount
		end
	end
end
