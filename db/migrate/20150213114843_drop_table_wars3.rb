class DropTableWars3 < ActiveRecord::Migration
  def change
  	 	drop_table :wars
  	create_table :wars do |t|
    	t.references :game
    	t.references :tournoi
    	t.references :user_1
    	t.references :user_2
    	t.integer :scoreJ1
    	t.integer :scoreJ2
      t.timestamps
  end
  end
end
