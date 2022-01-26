fx_version 'bodacious'
games { 'gta5' }

description 'Quest System Written by AliReza_At'

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"Config/config.lua",
	"Server/server.lua"
}

client_scripts {
	"Config/config.lua",
	"Client/client.lua"
}
