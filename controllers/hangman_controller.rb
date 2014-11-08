class HangmanController < ApplicationController

get '/' do
		content_type :json
		word = WordNik.find_word
		letter_guessed = params[:letter_guessed]

		{
			guesses: letter_guessed
		}.to_json
	end

end