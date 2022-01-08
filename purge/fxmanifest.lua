fx_version 'cerulean'

game 'gta5'

author 'temptedx'
version '1.0.0'
description 'Purge alarm for fivem servers, this just plays alarm nothing else.'

client_scripts {
    'client/main.lua',
    'client/nui.lua',
    'config.lua',
}

server_scripts {
    'server/main.lua',
    'server/nui.lua',
    'config.lua',
}

files {
    'html/index.html',
    'html/sounds/alarm.ogg',
    'html/sounds/siren.ogg',
}

ui_page 'html/index.html'