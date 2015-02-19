class ModifyLocationTable < ActiveRecord::Migration
  def change
  drop_table :locations
  	create_table :locations do |t|
    	t.integer :locatable
    	t.string :locatable_type
  	end
    add_column :locations, :address, :string
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end