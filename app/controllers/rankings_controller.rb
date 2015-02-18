class RankingsController < ApplicationController
	
	def index
		@tournoi = Tournoi.all
		@game = Game.all
		@war = War.all
		@user = User.all
	end
	def new
	end
	def edit
	end
	def update
	end
end
