class CreateWars < ActiveRecord::Migration
  def change
    create_table :wars do |t|
    	t.references :game_id
    	t.references :tournoid_id
    	t.references :user_id
    	t.references :user_id
    	t.integer :scoreJ1
    	t.integer :scoreJ2
      t.timestamps
    end
  end
end
