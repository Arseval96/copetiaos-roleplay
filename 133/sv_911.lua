-- Simple 133 Command (With Location & Blip) -- 
		-- Made By Chezza --

displayLocation = true  -- By Changing this to 'false' it will make it so your location is not displayed in chat --
blips = true -- By Changing this to 'false' it will disable 133 call blips meaning your location will not be shown on the map --
disableChatCalls = false -- By Chaning this to 'false' it will make it so 133 call are not displayed in chat (Recommended to have Discord Webhook setup if disabling this) --
webhookurl = 'https://discordapp.com/api/webhooks/580684411260108800/kC95OvHJ_qQWsXcQW4sbRissQXjzks4XF0n19y2CIE3fm7X4qH4z2LneqRqIvUu9uJWW' -- Add your discord webhook url here, if you do not want this leave it blank (More info on FiveM post) --

-- Code --

RegisterServerEvent('133')
AddEventHandler('133', function(location, msg, x, y, z, name, ped)
	local playername = GetPlayerName(source)
	local ped = GetPlayerPed(source)
	if displayLocation == false then
		if disableChatCalls == false then
			TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4133 | Llamada de ID: ^r' .. playername .. '^*^4 | Reporte: ^r' .. msg)
			sendDiscord('133 Emergencias', '**133 | Llamada de ID: **' .. playername .. '** | Reporte: **' .. msg)  
		else
			sendDiscord('133 Emergencias', '**133 | Llamada de ID: **' .. playername .. '** | Reporte: **' .. msg)  
		end
	else
		if disableChatCalls == false then
			TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4133 | Llamada de ID: ^r' .. playername .. '^*^4 | Ubicacion: ^r' .. location .. '^*^4 | Reporte: ^r' .. msg)
			sendDiscord('133 Emergencias', '**133 | Llamada de ID: **' .. playername .. '** | Ubicacion: **' .. location .. '** | Reporte: **' .. msg)
		else
			sendDiscord('133 Emergencias', '**133 | Llamada de ID: **' .. playername .. '** | Ubicacion: **' .. location .. '** | Reporte: **' .. msg)
		end
		if blips == true then
			TriggerClientEvent('133:setBlip', -1, name, x, y, z)
		end
	end
end)

function sendDiscord(name, message)
  	PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end


	