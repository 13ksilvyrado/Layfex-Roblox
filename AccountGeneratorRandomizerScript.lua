-- Author; MK7ESKIMO
local ApprovedID = {87112888}
local Randomizer = math.random(10000,99999)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")
local RemoteFunction = ReplicatedStorage:WaitForChild("RemoteFunction")
local Chat = game:GetService("Chat")
local TextChatService = game:GetService("TextChatService")
local TextChatCommand = TextChatService:WaitForChild("TextChatCommand")
local TextChatCommands = TextChatService:WaitForChild("TextChatCommands")
local TextChatCommand1 = TextChatCommands:WaitForChild("Command1")
local TextChat 

-- make it where when a random person joins it generates a 5 digit number in the output
-- make it where only the approved id can use the command
-- make it where the command is /random
-- make it where the command will output the random number in the output
-- make it where the command will output the random number in the chat
-- make it where the command will output the random number in the chat as the player
-- make it where the command will output the random number in the chat as the player with the id and telling the player its their new ID