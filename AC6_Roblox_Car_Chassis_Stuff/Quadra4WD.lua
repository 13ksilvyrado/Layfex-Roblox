-- Author; ProletariatAlaskan

-- Waits for the A-Chassis to load
local chassis = script.Parent -- Make sure this is pointing to your chassis object

-- Defines the wheels or parts that need to be driven
local frontLeftWheel = chassis:WaitForChild("FrontLeftWheel")
local frontRightWheel = chassis:WaitForChild("FrontRightWheel")
local rearLeftWheel = chassis:WaitForChild("RearLeftWheel")
local rearRightWheel = chassis:WaitForChild("RearRightWheel")

-- Defines the motors for the wheels
local frontLeftMotor = frontLeftWheel:WaitForChild("Motor")
local frontRightMotor = frontRightWheel:WaitForChild("Motor")
local rearLeftMotor = rearLeftWheel:WaitForChild("Motor")
local rearRightMotor = rearRightWheel:WaitForChild("Motor")

-- Defines the power/torque for the motors
local motorTorque = 1000  -- Adjust as needed for your car's performance

-- Defines the slip threshold for 4WD engagement (you can adjust this for sensitivity)
local slipThreshold = 0.2  -- Percentage of wheel speed difference between rear and front wheels

local isIn4WD = false  -- Start in RWD mode
local userControlled4WD = false  -- Start with user control off

function checkWheelSlip()
	-- Gets the current velocity of the wheels (assuming we're measuring linear velocity)
	local rearWheelSpeed = (rearLeftWheel.Velocity + rearRightWheel.Velocity) / 2
	local frontWheelSpeed = (frontLeftWheel.Velocity + frontRightWheel.Velocity) / 2

	-- Calculates the speed difference between rear and front wheels (percentage slip)
	local slipRatio = math.abs(rearWheelSpeed - frontWheelSpeed) / rearWheelSpeed

	return slipRatio > slipThreshold  -- Returns true if slip exceeds threshold
end

-- The Core Function to apply the drive system
function applyDriveSystem()
	-- If the system is in manual control (user toggled), use that
	if userControlled4WD then
		-- Applies torque based on the manual toggle
		if isIn4WD then
			-- In 4WD mode, applies torque to all four wheels
			frontLeftMotor.TargetTorque = motorTorque
			frontRightMotor.TargetTorque = motorTorque
			rearLeftMotor.TargetTorque = motorTorque
			rearRightMotor.TargetTorque = motorTorque
		else
			-- In RWD mode, applies torque only to the rear wheels
			frontLeftMotor.TargetTorque = 0
			frontRightMotor.TargetTorque = 0
			rearLeftMotor.TargetTorque = motorTorque
			rearRightMotor.TargetTorque = motorTorque
		end
	else
		-- Automatic 4WD based on wheel slip
		if checkWheelSlip() then
			if not isIn4WD then
				-- Engage 4WD
				isIn4WD = true
				print("4WD Engaged!")
			end
		else
			if isIn4WD then
				-- Switch back to RWD
				isIn4WD = false
				print("4WD Disengaged. RWD Mode.")
			end
		end

		-- Applies torque to the wheels based on the automatic drive mode
		if isIn4WD then
			-- In 4WD mode, apply torque to all four wheels
			frontLeftMotor.TargetTorque = motorTorque
			frontRightMotor.TargetTorque = motorTorque
			rearLeftMotor.TargetTorque = motorTorque
			rearRightMotor.TargetTorque = motorTorque
		else
			-- In RWD mode, applies torque only to the rear wheels
			frontLeftMotor.TargetTorque = 0
			frontRightMotor.TargetTorque = 0
			rearLeftMotor.TargetTorque = motorTorque
			rearRightMotor.TargetTorque = motorTorque
		end
	end
end

function onKeyPress(input)
	if input.KeyCode == Enum.KeyCode.N then
		userControlled4WD = not userControlled4WD  -- Toggle manual control on or off
		print(userControlled4WD and "Manual 4WD control ON" or "Manual 4WD control OFF")

		-- If we just switched to manual control, default to RWD
		if userControlled4WD then
			isIn4WD = false
		end
	end
end

-- Connects the key press function
game:GetService("UserInputService").InputBegan:Connect(onKeyPress)

-- Continuous update to check and apply the drive system
while true do
	applyDriveSystem()
	wait(0.1)  -- Updates every 0.1 seconds, tweak if necessary
end
