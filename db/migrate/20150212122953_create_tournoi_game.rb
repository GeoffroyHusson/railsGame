class CreateTournoiGame < ActiveRecord::Migration
  def change
    create_table :tournoi_games do |t|
    	t.references :game
    	t.references :tournoi
    end
  end
end
