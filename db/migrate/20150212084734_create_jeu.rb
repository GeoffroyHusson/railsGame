class CreateJeu < ActiveRecord::Migration
  def change
    create_table :jeus do |t|
      t.string :titre
      t.string :description
      t.string :id_Createur
    end
  end
end
