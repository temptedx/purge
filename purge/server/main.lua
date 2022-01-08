RegisterServerEvent("purge:RequestSound")
AddEventHandler("purge:RequestSound", function()
    local src = source
    if Config.OpenMenuIdentifierRestriction then
        local foundIdentifier = false
        for a = 1, #Config.LicenseIdentifiers do
            if not foundIdentifier then
                if GetPlayerId('license', src) == Config.LicenseIdentifiers[a] then
                    foundIdentifier = true
                end
            end
        end
        for b = 1, #Config.SteamIdentifiers do
            if not foundIdentifier then
                if GetPlayerId('steam', src) == Config.SteamIdentifiers[b] then
                    foundIdentifier = true
                end
            end
        end
        if foundIdentifier then
            TriggerClientEvent("purge:StartSound", src)
            return
        else
            TriggerClientEvent("purge:IdentifierRestricted", src)
        end
    else
        TriggerClientEvent("purge:StartSound", src)
    end
end)

function GetPlayerId(type, id)
    local identifiers = GetPlayerIdentifiers(id)
    for i = 1, #identifiers do
        if string.find(identifiers[i], type, 1) ~= nil then
            return identifiers[i]
        end
    end
    return false
end