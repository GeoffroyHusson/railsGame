class War < ActiveRecord::Base
	belongs_to :tournoi
	belongs_to :game
	belongs_to :user_1, :class_name => "User"
  	belongs_to :user_2, :class_name => "User"




  	#DEFINE
  	WIN = 3
  	LOST = 0
  	DRAW = 1

end
