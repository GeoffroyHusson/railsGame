class AddReferencesToLocations < ActiveRecord::Migration
  def change	
  	drop_table :locations
  	 create_table :locations do |t|
		t.references :user
    	t.references :tournoi
      t.timestamps
    end

  end
end
