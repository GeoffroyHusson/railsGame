class Game < ActiveRecord::Base
	belongs_to :user
	has_many :tournois, through: :tournoi_games
	has_many :tournoi_games
end
