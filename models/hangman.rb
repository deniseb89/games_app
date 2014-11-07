class Hangman < ActiveRecord::Base
	def initialize(word)
		@guessed_letters = []
	end
	def guess_letter(letter_guessed)
		word.chars.gsub("", "_") unless word.include?(letter_guessed)
		@guessed_letters << letter_guessed
	end

	def win_game
		if (word.chars - @guessed_letters) == 0 && remaining_tries > 0
			game_over # write this method
		end
	end

	def lose_game
		if (word.chars - @guessed_letters) != 0 && remaining_tries == 0
			game_over
		end
	end
end