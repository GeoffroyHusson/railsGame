class Tournoi < ActiveRecord::Base
	has_many :games, through: :tournoi_games
	has_many :tournoi_games
	has_many :users, through: :register_tournois 
	has_many :register_tournois
	has_many :wars
	 has_one :location, :as => :locatable
  accepts_nested_attributes_for :location



end
