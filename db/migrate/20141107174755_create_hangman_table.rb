class CreateHangmanTable < ActiveRecord::Migration
  def change
  	create_table :hangmen do |t|
  		t.string :random_word
      t.string :bad_guesses, default: ""
      t.string :game_state

  		t.timestamps
  	end
  end
end
