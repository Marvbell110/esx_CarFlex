fx_version 'adamant'

game 'gta5'

description 'ESX CarFlex'

version '1.3'

dependency 'NativeUI'

client_script '@NativeUI/NativeUI.lua'

client_scripts {
    'config.lua',
    'client/spawn.lua',
    'client/carflex.lua',
    'client/menu.lua',
    'client/client.lua'
}

server_script {
    'config.lua',
    'server/server.lua'
}
