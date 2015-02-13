class Tournoi < ActiveRecord::Base
	has_many :games, through: :tournoi_games
	has_many :tournoi_games
	has_many :users, through: :register_tournois 
#	has_many :users, through: :wars
	has_many :register_tournois
	has_many :wars
end
