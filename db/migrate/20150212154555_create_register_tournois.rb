class CreateRegisterTournois < ActiveRecord::Migration
  def change
    create_table :register_tournois do |t|

      t.timestamps
    end
  end
end