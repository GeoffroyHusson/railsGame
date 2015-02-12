class DropColumnToUser < ActiveRecord::Migration
  def change
  	remove_column :users, :statut, :string
  	add_column :users, :statut, :integer
  end
end
