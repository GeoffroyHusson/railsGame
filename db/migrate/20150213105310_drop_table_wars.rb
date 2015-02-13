class DropTableWars < ActiveRecord::Migration
  def change
  	drop_table :wars
  	create_table :wars do |t|
    	t.references :game_id
    	t.references :tournoid_id
    	t.references :user, :as => 'joueur1'
    	t.references :user, :as => 'joueur2'
    	t.integer :scoreJ1
    	t.integer :scoreJ2
      t.timestamps
  end
  end
end
