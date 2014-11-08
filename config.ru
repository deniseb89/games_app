require 'bundler'
Bundler.require(:default)

Dir.glob('./{helpers,models,controllers}/*.rb').each do |file|
	require file
	puts "required #{file}"
end

map('/'){run ApplicationController}
map('/hangman'){run HangmanController}
map('/tictactoe'){run TicTacToeController}
map('/sessions'){run SessionsController}
