-- // Variables // -- 
local uis = game:GetService('UserInputService')
local gui = script.Parent
local car = gui.Car.Value
local tune = require(car['A-Chassis Tune'])
local tires = script.Parent["RTRA Tire System"] -- For RTRA A-chassis 1.5 AC6
local core = script.Parent.Parent["A-Chassis Interface"].Drive
-- // the stuff that actually makes electronic stability control a thing // --

local function ESC()
    local speed = core.Velocity.Magnitude
    local steer = core.SteerAngle
    local slipanglefront = math.deg(math.atan2(core.FrontRightWheel.AngularVelocity - (core.FrontLeftWheel.AngularVelocity * tune['SteerRatio']), speed))
    local slipanglerear = math.deg(math.atan2(core.RearRightWheel.AngularVelocity - (core.RearLeftWheel.AngularVelocity * tune['SteerRatio']), speed))
    if uis:IsKeyDown(Enum.KeyCode.A) then -- // if A or D is pressed, it apply brakes to all wheels // --
		core.BrakeTorque = 5500
	else 
		if uis:IsKeyDown(Enum.KeyCode.D) then 
			core.BrakeTorque = 5500
		end
        wait(0.1)
	end
end
