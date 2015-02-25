class Game < ActiveRecord::Base
	belongs_to :user
	has_many :tournois, through: :tournoi_games
	has_many :tournoi_games
	has_many :wars
	validates_uniqueness_of :title
	validates_presence_of :title,:description


	def users 
		user_ids = (self.wars.pluck(:user_1_id).uniq+self.wars.pluck(:user_2_id).uniq).uniq
		users = User.find(user_ids)
	end
end
