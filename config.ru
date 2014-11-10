require 'bundler'
Bundler.require(:default)

require './helpers/authentication_helper'
require './controllers/application_controller'

Dir.glob('./{helpers,models,controllers}/*.rb').each do |file|
	puts "requiring #{file}"
	require file
end

map('/'){run ApplicationController}
map('/hangman'){run HangmanController}
map('/tictactoe'){run TicTacToeController}
map('/sessions'){run SessionsController}
