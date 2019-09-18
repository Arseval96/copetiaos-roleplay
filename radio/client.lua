--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

Citizen.CreateThread(function()
	local radio = false
	while true do
		Citizen.Wait(0)
		local lPed = GetPlayerPed(-1)
		RequestAnimDict("random@arrests")
		if IsControlPressed(1, 246) then
			if DoesEntityExist(lPed) and not IsPedSittingInAnyVehicle(lPed) then
				Citizen.CreateThread(function()
					RequestAnimDict("random@arrests")
					while not HasAnimDictLoaded("random@arrests") do
						Citizen.Wait(100)
					end

					if not radio then
						radio = true
						TaskPlayAnim(lPed, "random@arrests", "generic_radio_chatter", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
					end   
				end)
			end
		end

		if IsControlReleased(1, 246) then
			if DoesEntityExist(lPed) and not IsPedSittingInAnyVehicle(lPed) then
				Citizen.CreateThread(function()
					RequestAnimDict("random@arrests")
					while not HasAnimDictLoaded("random@arrests") do
						Citizen.Wait(100)
					end

					if radio then
						radio = false
						ClearPedSecondaryTask(lPed)
					end
				end)
			end
		end
	end
end)