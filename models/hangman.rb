class Hangman < ActiveRecord::Base

  belongs_to :user

  def guess_letter(letter)
    index = self.random_word.index(letter)
    if index # What if there is the same letter more than once?
      state = self.game_state.dup
      state[index] = letter
      self.update({game_state: state})
    else
      bad = self.bad_guesses
      bad+=letter
      self.update({bad_guesses: bad})
    end
    self.game_state
  end

end