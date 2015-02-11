class CreateTournois < ActiveRecord::Migration
  def change
    create_table :tournois do |t|

      t.timestamps
    end
  end
end
