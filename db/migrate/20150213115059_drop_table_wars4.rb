class DropTableWars4 < ActiveRecord::Migration
  def change
  	drop_table :wars
  	create_table :wars do |t|
    	t.references :game
    	t.references :tournoi
    	t.integer :user_1, references: :users
    	t.integer :user_2, references: :users
    	t.integer :scoreJ1
    	t.integer :scoreJ2
      t.timestamps
  end
  end
end
