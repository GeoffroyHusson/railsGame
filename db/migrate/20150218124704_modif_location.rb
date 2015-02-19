class ModifLocation < ActiveRecord::Migration
   def change
  drop_table :locations
  	create_table :locations do |t|
    	t.string :address
    	t.references :locatable, :polymorphic => true
  	end
  end
end