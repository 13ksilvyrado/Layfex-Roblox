-- ancient ass fucking script and tried do debug like a bitch but i wasnt able to, good fucking luck fixing this dog shit.
function Tire(C)
 if C.Name == "FL" then -- Change FL to the name of the tire
  if C.CanCollide == true then
			C.CanCollide = false
		end
		function Tire(C)
			if C.Name == "FR" then -- Change FL to the name of the tire
				if C.CanCollide == true then
					C.CanCollide = false
				end
				function Tire(C)
					if C.Name == "RL" then -- Change FL to the name of the tire
						if C.CanCollide == true then
							C.CanCollide = false
						end
						function Tire(C)
							if C.Name == "RR" then -- Change FL to the name of the tire
								if C.CanCollide == true then
									C.CanCollide = false
								end
							end
						end
					end
				end
			end
		end
	end
end

script.Parent.Touched:connect(Tire)
