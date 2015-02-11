class AddNameStatutToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :statut, :string
  end
end
