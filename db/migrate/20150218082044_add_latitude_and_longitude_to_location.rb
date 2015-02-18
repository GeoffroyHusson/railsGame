class AddLatitudeAndLongitudeToLocation < ActiveRecord::Migration
  def change
  	create_table :locations do |t|
		t.references :user
    	t.references :tournoi
      t.timestamps
  end
    add_column :locations, :address, :string
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end
