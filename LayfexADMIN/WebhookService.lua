local ProxyService = require(script.Parent.ProxyService)

local Proxy = ProxyService:New('URL', 'ACCESS_KEY') -- Put your proxy heroku domain and access key here if you have one.

---------------------------------------------------------------------------------------

local webhookService = {}

local https = game:GetService("HttpService")


function webhookService:createMessage(url, message)
	local data = {
		["content"] = message
	}
	local finalData = https:JSONEncode(data)
	Proxy:Post(url, finalData)
end

function webhookService:createEmbed(url, title, message, image)
	local data = {
		['content'] = "",
		['embeds'] = {{
			["image"] = {["url"] = image},
			['title'] = "**"..title.."**",
			['description'] = message,
			['type'] = "rich",
			["color"] = tonumber(0xffffff)
		}}
	}
	local finalData = https:JSONEncode(data)
	Proxy:Post(url, finalData)
end


return webhookService


--[[Simple Message Example: 

local url = "Url Here"

local webhookService = require(game.ServerStorage.WebhookService)

webhookService:createMessage(url, "Message Here")

webhookService:createEmbed(url, "Title Here", "Message Here", "Image Link Here (OPTIONAL)")


]]

-- Use these examples in a SERVER SCRIPT!
