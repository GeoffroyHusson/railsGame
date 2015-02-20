class RankingsController < ApplicationController
	
	def index
		@tournois = Tournoi.all
		@games = Game.all
		@wars = War.all
		@users = User.all
		@tabG = []
		@games.each do |g|
			tab = []
			@users.each do |u|
		    	score = @wars.where(user_1_id: u.id,game_id: g.id).sum(:scoreJ1) + @wars.where(user_2_id: u.id).sum(:scoreJ2)
				w = 0
				n = 0
				l = 0
				@wars.where(user_1_id: u.id,game_id: g.id).each do |sc|
					if sc.scoreJ1 == 3
						w +=1
					end
					if sc.scoreJ1 == 1
						n +=1
					end
					if sc.scoreJ1 == 0
						l +=1
					end
				end

				@wars.where(user_2_id: u.id,game_id: g.id).each do |sc|
					if sc.scoreJ2 == 3
						w +=1
					end
					if sc.scoreJ2 == 1
						n +=1
					end
					if sc.scoreJ2 == 0
						l +=1
					end
				end
				s = [u.name,score,w,l,n]
				tab.push(s)
				tab.sort! {|a,b| b[1] <=> a[1]}
			end
			@tabG.push(tab)
		end
	end
	def new
	end
	def edit
	end
	def update
	end
end
