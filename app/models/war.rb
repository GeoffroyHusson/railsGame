class War < ActiveRecord::Base
	belongs_to :tournoi
	belongs_to :game
	belongs_to :user_1, :class_name => "User"
  	belongs_to :user_2, :class_name => "User"
  	validates :user_1_id,:user_2_id,:game_id, :presence => true
  	validate :checkDataSamePlayer  


  	#DEFINE
  	WIN = 3
  	LOST = 0
  	DRAW = 1

  def checkDataSamePlayer
    if self.user_1_id == self.user_2_id
		  errors.add(:user_2_id, "Un joueur ne peux pas jouer contre lui même.")
    end
  end

end
