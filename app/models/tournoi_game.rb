class TournoiGame < ActiveRecord::Base
	belongs_to :tournoi
	belongs_to :game
end
