class HangmanController < ApplicationController

get '/' do
		content_type :json
		word = WordNik.find_word['word']
		letter_guessed = params[:letter_guessed]

		if word.include?(letter_guessed)
			word = word.chars.gsub(/"#{letter_guessed}"/i, "#{letter_guessed}")
		else
			word = word.chars.gsub!("_")
		end
		{
			guesses: letter_guessed
		}.to_json
	end

end