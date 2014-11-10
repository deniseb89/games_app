require 'bundler'
Bundler.require(:default)

require './controllers/application_controller'

Dir.glob('./{models,controllers}/*.rb').each do |file|
  puts "requiring #{file}"
  require file
end

map('/'){run ApplicationController}
map('/hangman'){run HangmanController}
map('/tictactoe'){run TicTacToeController}
