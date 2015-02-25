class RegisterTournoi < ActiveRecord::Base
	belongs_to :tournoi 
	belongs_to :user
	validates_uniqueness_of :user_id, scope: :tournoi_id
end
