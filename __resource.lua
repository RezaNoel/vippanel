-- client_script "main.lua"
-- client_script "config.lua"

fx_version 'cerulean'
game 'gta5'

author 'Have Good Time..!'
description 'Have Fun..!'
version '1.3.0'

resource_type 'gametype' { name = 'My awesome game type!' }

client_scripts {
    "client/functions.lua",
    "client/main.lua",

}

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
    "server/functions.lua",
    "server/main.lua",
}