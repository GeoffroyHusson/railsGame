class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.string :id_Owner
    end
  end
end
