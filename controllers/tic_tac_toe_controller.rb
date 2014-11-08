class TicTacToeController < ApplicationController
	get '/' do
		api_response = HTTParty.get("http://colourlovers.com/api/palettes/random")
		@title = api_response['palettes']['palette']['title']
		@hex = api_response['palettes']['palette']['colors']['hex']
		erb :tictactoe
	end
end