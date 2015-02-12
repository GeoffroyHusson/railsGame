class AddReferenceToGame < ActiveRecord::Migration
  def change
  	drop_table :games
  	 create_table :games do |t|
      t.string :title
      t.string :description
      t.references :user
    end
  end
end
