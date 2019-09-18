function isPlayerOnline(PID)
local playerExists = DoesEntityExist(GetPlayerPed(GetPlayerFromServerId(PID)))
return playerExists
end
--  listen for keys
Citizen.CreateThread(function()
while true do
    Citizen.Wait(0)
	if IsControlJustPressed(1, 61) then
		if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			TriggerEvent('NoSiren')
		end
	end
end
end)

-- Updates sirens every 2 seconds
Citizen.CreateThread(function()
while true do
    Citizen.Wait(2000)
	local Ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(Ped, true) then
		local Veh = GetVehiclePedIsIn(Ped, false)

			local PF = GetVehiclePaintFade(Veh)
			local Toggle = false
			if PF < 0.04 then
				Toggle = true
			end

			TriggerServerEvent('SilentSiren', Toggle)

	end
end
end)

-- Initial siren enable/disable. Sends to server
AddEventHandler('NoSiren', function()
Citizen.CreateThread(function()
	local Ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(Ped, true) then
		local Veh = GetVehiclePedIsIn(Ped, false)

		if GetPedInVehicleSeat(Veh, -1) == Ped then

			local OldPF = GetVehiclePaintFade(Veh)
			local Toggle = false
			if OldPF < 0.04 then
				Toggle = true
			end

			local PF = 0.1
			if not Toggle then
				PF = 0.0
			end

			SetVehiclePaintFade(Veh, PF)
			TriggerServerEvent('SilentSiren', not Toggle)
		end
	end

end)
end)

-- Called by server to disable siren on any target vehicle
RegisterNetEvent('updateSirens')
AddEventHandler('updateSirens', function(PID, Toggle)
if isPlayerOnline(PID) then
local Veh = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(PID)), false)
DisableVehicleImpactExplosionActivation(Veh, Toggle)
end
end)