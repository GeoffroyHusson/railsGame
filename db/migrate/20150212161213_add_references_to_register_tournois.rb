class AddReferencesToRegisterTournois < ActiveRecord::Migration
  def change
drop_table :register_tournois
  	 create_table :register_tournois do |t|
      t.references :user
      t.references :tournoi
  end
  end
end
