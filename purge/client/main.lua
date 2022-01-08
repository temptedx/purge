purgeover = false
whitelist = false

function PurgeStart()
    TriggerServerEvent('purge:PlayOnAll', 'alarm', 0.7)
    Citizen.Wait(70000)
    while Config.Amount ~= 0 and not purgeover do
        TriggerServerEvent('purge:PlayOnAll', 'siren', 1.0)
        Citizen.Wait(87000)
	Config.Amount = Config.Amount - 1
    end
end

RegisterNetEvent("purge:IdentifierRestricted")
AddEventHandler("purge:IdentifierRestricted", function()
    Citizen.Wait(0)
end)

RegisterNetEvent("purge:StartSound")
AddEventHandler("purge:StartSound", function()
    whitelist = true
end)

RegisterCommand("purge", function(source)
	TriggerServerEvent("purge:RequestSound")
	if whitelist then
		notify("~b~Starting the ~r~Purge!")
        	PurgeStart()
    else
        Citizen.Wait(0)
    end
end)

RegisterCommand("stoppurge", function(source)
	TriggerServerEvent("purge:RequestSound")
	if whitelist then
		notify("~b~Stopping the ~r~Purge!")
        purgeover = true
    else
        Citizen.Wait(0)
    end
end)

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end