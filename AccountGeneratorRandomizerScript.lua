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
