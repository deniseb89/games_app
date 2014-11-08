class Hangman < ActiveRecord::Base

  belongs_to :user

  def guess_letter(letter)
  	if self.word.include?(letter)
  		letter_locations = []
  		self.word.chars.each_with_index do |word_letter, index|
  			if word_letter == letter
  				letter_locations << index
  			end
  		end
  		state = self.game_state.dup
  		letter_locations.each do |letter_index|
  			state[letter_index] = letter
  		end
  		self.update({game_state: state})
  	else
	  	bad = self.bad_guesses
	  	bad += letter
	  	self.update({bad_guesses: bad})
  	end
  	self.game_state
  end
end