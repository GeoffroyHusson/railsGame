class Tournoi < ActiveRecord::Base
	has_many :games, through: :tournoi_games
	has_many :tournoi_games
	has_many :users, through: :register_tournois 
	has_many :register_tournois
	has_many :wars
	has_one :location, :as => :locatable
  	accepts_nested_attributes_for :location
  	validates_presence_of :name,:date,:nbPlayerMax



  	def already_register?(user)
		self.register_tournois.where(user_id: user.id).any?
  	end
  	def full?
  		self.users.count < self.nbPlayerMax
  	end


  	#DEFINE
  	WIN = 3
  	LOOSE = 0
  	NULL = 1





end
