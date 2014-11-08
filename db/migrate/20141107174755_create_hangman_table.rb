class CreateHangmanTable < ActiveRecord::Migration
  def change
  	create_table :hangmans do |t|
  		t.string :random_word
  		t.string :guessed_letters
  		t.integer :remaining_tries
  		t.integer :wins
  		t.integer :losses
      t.string :bad_guesses
      t.string :game_state

  		t.timestamps
  	end
  end
end
