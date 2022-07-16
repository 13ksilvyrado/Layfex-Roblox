print("Layfex headmovement loaded")
local camera = workspace.CurrentCamera


local character = game.Players.LocalPlayer.Character
local root = character:WaitForChild("HumanoidRootPart")
local neck = character:FindFirstChild("Neck", true)
local yOffset = neck.C0.Y

local CFNew, CFAng, asin = CFrame.new, CFrame.Angles, math.asin

game:GetService("RunService").RenderStepped:Connect(function()
	local cameraDirection = root.CFrame:toObjectSpace(camera.CFrame).lookVector
	
	if neck then 
		neck.C0 = CFNew(0, yOffset, 0) * CFAng(0, - asin(cameraDirection.x), 0) * CFAng(asin(cameraDirection.y), 0, 0)
	end
end)


--Add me to StarterPlayerScripts
