--[[ FX Information ]]--
fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'fsg_scratchgunserial'
author       'github.com/fsgdev'
version      '1.0.0'
description  'Scratch serial numbers off guns / weapons'

--[[ Manifest ]]--
dependencies {
	'ox_inventory',
	'ox_lib',
}

shared_scripts {
	'@ox_lib/init.lua'
}

server_scripts {
	'server.lua',
}