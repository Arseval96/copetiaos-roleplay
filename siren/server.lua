local playersWithoutSiren = {}

RegisterServerEvent('SilentSiren')

AddEventHandler('SilentSiren', function(Toggle)
local netID = source
TriggerClientEvent('updateSirens', -1, netID, Toggle)
playersWithoutSiren[netID] = Toggle
end)
