local standardVolumeOutput = 0.3;
local hasPlayerLoaded = false

Citizen.CreateThread(function()
	Wait(1000)
	hasPlayerLoaded = true
end)

RegisterNetEvent('purge:PlayOnAll')
AddEventHandler('purge:PlayOnAll', function(soundFile, soundVolume)
    if hasPlayerLoaded then
        SendNUIMessage({
            transactionType = 'playSound',
            transactionFile = soundFile,
            transactionVolume = soundVolume or standardVolumeOutput
        })
    end
end)