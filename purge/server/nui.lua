RegisterNetEvent('purge:PlayOnAll')
AddEventHandler('purge:PlayOnAll', function(soundFile, soundVolume)
    TriggerClientEvent('purge:PlayOnAll', -1, soundFile, soundVolume)
end)