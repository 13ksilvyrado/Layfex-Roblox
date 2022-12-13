local url = "your discord webhook url here" 
local http = game:GetServices("HttpService")
local whatgame = game.placeId

game.Players.PlayerAdded:Connect(function(data)

data = {
 ['embeds'] = {{
 ['title'] = math.random(5, 1000), -- ONLY MAX IS 1 THOUSAND DO NOT GO PAST THAT.
 ['description'] = "your serial number will be displayed above!",
 ['url'] = "https://www.roblox.com/games/" ..whatgame,
 }}
}

local finals = http:JSONEncode(data)
http:PostAsync(url, finals)

end)
print(data)
-- Author; AzovWarrior711
