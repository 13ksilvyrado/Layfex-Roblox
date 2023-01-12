--[[

DEVELOPED AND MANUFACTEURED BY ARSONWARE 2023.

--]]

local format = "XX0000XX" -- change whatever format you want lol. X = Letters, 0 = Numberals.
local plate = "" -- leave this blank
local webHook = "YOUR WEBHOOK BELONGS HERE!"
local http = game:GetService("HttpService")
local whatGame = game.PlaceId

for i = 1, #format do 
	local c = string.sub(format, i, i)
	if (c == "0") then
		plate = plate..tostring(math.random(0,9))
	elseif (c == "X") then
		plate = plate..string.char(math.random(65, 90))
	else
		plate = plate..c
	end
end

game.Players.PlayerAdded:Connect(function(plateData)
	plateData = {
		['embeds'] = {{
			['title'] = "Someones car spawned in!", 
			['description'] = "License plate is printed here;  ".. plate,
			['url'] = "https://www.roblox.com/games/" ..whatGame,
		}}
	}

	local finals = http:JSONEncode(plateData)
	http:PostAsync(webHook, finals)
	print(plateData)
end)

for i, v in pairs(script.Parent.Plates:GetChildren()) do
	v.SGUI.ID.Text = plate
end
