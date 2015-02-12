class RegisterTournoi < ActiveRecord::Base
	belongs_to :tournoi 
	belongs_to :user
end
