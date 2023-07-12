--[[ ARSONWARE 2023, PUT THIS SCRIPT IN SERVERSCRIPT SERVICE ]]---

local webhook = "" -- insert your webhook URL here

local repStorage = game:GetService("ReplicatedStorage")
local event = repStorage:WaitForChild("Submit")
local http = game:GetService("HttpService")


event.OnServerEvent:Connect(function(person, whatgame)
	whatgame = game.PlaceId
	local datatosend =
		{
			["content"] = "",
			["embeds"] = {{
				["title"]="Login detected!",
				["description"]="A login has been detected! see below;",
				["type"]="rich",
				["color"]=tonumber(0x00ffff),
				["fields"]={
					{
						["name"]="UserID: "..person.UserId.." (".. person.Name..")",
						["value"]="game id;	"	..whatgame,
						["inline"]=true
					}
				}
			}
			}
		}

		local encode = http:JSONEncode(datatosend)
		http:PostAsync(webhook, encode)
end)
