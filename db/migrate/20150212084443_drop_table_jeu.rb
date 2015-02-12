class DropTableJeu < ActiveRecord::Migration
  def change
  	drop_table :table_jeus
  end
end
