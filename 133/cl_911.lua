-- Simple 133 Command (With Location & Blip) -- 
		-- Made By Chezza --

displayTime = 300 -- Refreshes Blips every 5 Minutes by Default --  

-- Code --

blip = nil
blips = {}

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/133', 'Llama al 133 para emergencias!', {
    { name="Report", help="Introduzca el incidente/informe aquí!" }
})
end)

RegisterNetEvent('133:setBlip')
AddEventHandler('133:setBlip', function(name, x, y, z)
    blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 66)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('133 Call - ' .. name)
    EndTextCommandSetBlipName(blip)
    table.insert(blips, blip)
    Wait(displayTime * 1000)
    for i, blip in pairs(blips) do 
        RemoveBlip(blip)
    end
end)

-- Command -- 

RegisterCommand('133', function(source, args)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chatMessage', '^5133', {255,255,255}, ' ^7Por favor introduzca su ^1informe/problema.')
    else
        TriggerServerEvent('133', location, msg, x, y, z, name)
    end
end)

