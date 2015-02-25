class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :wars, :scoreJ1, :scorej1
  	rename_column :wars, :scoreJ2, :scorej2
  end
end
