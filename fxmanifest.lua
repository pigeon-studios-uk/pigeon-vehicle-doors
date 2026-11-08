fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'pigeon-vehicle-doors'
author 'Pigeon Studios'
description 'Open and close vehicle doors, windows, the hood and the trunk by command or key, checked by the server and synced for everyone.'
version '0.1.0'
repository 'https://github.com/pigeon-studios-uk/pigeon-vehicle-doors'

-- Pigeon Studios version registry entry, read by server/version_check.lua.
pigeon_slug 'pigeon-vehicle-doors'

shared_script 'configuration/config.lua'

client_scripts {
    'locales/*.lua',
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
    'server/version_check.lua',
}
