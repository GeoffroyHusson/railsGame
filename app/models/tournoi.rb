class Tournoi < ActiveRecord::Base
	has_many :games, through: :tournoi_games
	has_many :tournoi_games
	has_many :users, through: :register_games
	has_many :register_games
end
