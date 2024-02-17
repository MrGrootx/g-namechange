fx_version 'adamant'

game 'gta5'

description 'namechange'

version '1.0'

lua54 'yes'
author 'Justgroot'

shared_scripts { '@es_extended/imports.lua', '@ox_lib/init.lua' }

server_scripts {
   '@es_extended/locale.lua',
   '@mysql-async/lib/MySQL.lua',
   'shared/Config.lua',
   'server/*.lua'
}

client_scripts {
   '@es_extended/locale.lua',
   'shared/Config.lua',
   'client/*.lua',
}
