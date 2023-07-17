local url = "your discord webhook url here" 
local http = game:GetService("HttpService")
local whatgame = game.placeId

game.Players.PlayerAdded:Connect(function(data)

data = {
 ['embeds'] = {{
 ['title'] = math.random(5, 1000), -- 5 to 1k, self explainatory.
 ['description'] = "your serial number will be displayed above!",
 ['url'] = "https://www.roblox.com/games/" ..whatgame,
 }}
}

local finals = http:JSONEncode(data)
http:PostAsync(url, finals)
print(data)
end)

-- Author; AzovWarrior711
