class CreateTableJeu < ActiveRecord::Migration
  def change
    create_table :table_jeus do |t|
      t.string :titre
      t.string :description
      t.string :id_Createur
    end
  end
end
