class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username, null: false
  		t.string :password_hash, null: false
  		t.integer :hangman_score
  		t.integer :tictactoe_score

  		t.timestamps
  	end
  end
end
