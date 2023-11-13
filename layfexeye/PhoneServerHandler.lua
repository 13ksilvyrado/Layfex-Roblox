----setup
local playerService = game:GetService("Players")
local chatService = game:GetService("Chat")
local http = game:GetService("HttpService")
--remotes
local sendingRemote = game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("phoneSend")
local recievingRemote = sendingRemote.Parent:WaitForChild("phoneRecieve")
local replyingRemote = sendingRemote.Parent:WaitForChild("phoneReply")
local messagingRemote = sendingRemote.Parent:WaitForChild("phoneMessage")
--

--clientinfotrade
sendingRemote.OnServerEvent:Connect(function(sender,kind,recipient)--recipient==plyrinstance
	if kind == "requestcall" and recipient then
		recievingRemote:FireClient(recipient,"callrequest",sender)
	elseif kind == "hangupcall" and recipient then
		recievingRemote:FireClient(recipient,"hangupedcall",sender)
	elseif kind == "stopcallrequest" and recipient then
		recievingRemote:FireClient(recipient,"stoprequestedcall",sender)
	end

	--reply
	if kind == "denycall" and recipient then
		replyingRemote:FireClient(recipient,"deniedcall",sender)
	elseif kind == "acceptcall" and recipient then
		replyingRemote:FireClient(recipient,"acceptedcall",sender)
	end
	--
end)
--

--messaging
messagingRemote.OnServerEvent:Connect(function(sender,message,recipient,relayer)
	wait(0.1)
	if recipient:FindFirstChild("phone") then
		print("from "..sender.Name.." to "..recipient.Name.." with "..message)
		chatService:Chat(recipient.phone.Handle,"["..recipient.Name.."] "..message,Enum.ChatColor.White)
		local http = game:GetService("HttpService")
		local relay = "webhook here"
		relayer = {
			['embeds'] = {{
				['title'] = sender.Name,
				['description'] = message..	"				to;						"	..recipient.Name,
			}}
		}

		local finals = http:JSONEncode(relayer)
		http:PostAsync(relay, finals)
	end
end)
--

--[[
recieve:
callrequest
hangupedcall
stoprequestedcall

send:
requestcall
stoprequestcall
denycall
acceptcall
hangupcall

replies:
deniedcall
acceptedcall
]]
