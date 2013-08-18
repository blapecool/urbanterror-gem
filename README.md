urbanterror-gem
===============

Provides a class and utilities to get informations and control Urban Terror servers via UDP queries.

## Installation

`gem install urbanterror`

## Examples
### Get player list and server's setting 
  
	require 'urbanterror'
		
	sv = UrbanTerror::Server.new 'myserveraddressonthe.net' #You can omit port, It'll use the default port: 27960
	sv.update_status
		
	puts 'Player list'
	sv.players.each do |player|
       	puts "#{player[:name]} with #{player[:score]} points and #{player[:ping]}ms ping"
	end
		
	puts 'settings list'
	sv.settings.each do |cvar, value|
       	puts "#{cvar} = #{value}"
	end

### Do some rcon commands 

	require 'urbanterror'
		
	sv = UrbanTerror::Server.new 'myserveraddressonthe.net', 1337, 'myl33tRc0np4$$w0rd'
	puts sv.rcon 'status'
