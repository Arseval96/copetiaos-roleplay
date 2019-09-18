trafficDensity = 0.01
pedDensity = 0.01
Citizen.CreateThread(function()
	while true do
	    SetVehicleDensityMultiplierThisFrame(trafficDensity)
	    SetPedDensityMultiplierThisFrame(pedDensity)
	    SetRandomVehicleDensityMultiplierThisFrame(trafficDensity)
	    SetParkedVehicleDensityMultiplierThisFrame(trafficDensity)
	    SetScenarioPedDensityMultiplierThisFrame(pedDensity, pedDensity)
	    
	Citizen.Wait(0)
	end
end)
