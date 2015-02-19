class ModififyTable < ActiveRecord::Migration
  def change
  drop_table :locations
  	create_table :locations do |t|
    	t.references :locationable, :polymorphic => true
  	end
    add_column :locations, :address, :string
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end
