class CreateTicTacToeTable < ActiveRecord::Migration
  def change
  	create_table :tictactoes do |t|

  		t.timestamps
  	end
  end
end
