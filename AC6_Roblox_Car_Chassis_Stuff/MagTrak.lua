-- // Variables // -- 
local uis = game:GetService('UserInputService')
local gui = script.Parent
local car = gui.Car.Value
local tune = require(car['A-Chassis Tune'])
local core = script.Parent.Parent["A-Chassis Interface"].Drive

-- // the stuff that makes it work // --
local function wheelspin()
    local wheel_speed = 0
    for _,wheel in pairs(car.Wheels:GetChildren()) do
        if wheel.Velocity.Magnitude > wheel_speed then
            wheel_speed = wheel.Velocity.Magnitude
        end
	end
end
