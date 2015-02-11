class AddPlaceDateNameNbPlayerMaxToTournoi < ActiveRecord::Migration
  def change
    add_column :tournois, :name, :string
    add_column :tournois, :place, :string
    add_column :tournois, :date, :date
    add_column :tournois, :nbPlayerMax, :integer
  end
end
