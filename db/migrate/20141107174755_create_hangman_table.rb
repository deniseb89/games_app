class CreateHangmanTable < ActiveRecord::Migration
  def change
  	create_table :hangmen do |t|
      t.references :user
  		t.string :random_word
      t.string :bad_guesses
      t.string :game_state

  		t.timestamps
  	end
  end
end
