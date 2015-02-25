class RankingsController < ApplicationController
	
	def index
		@tabG = []
		@games = Game.joins(:wars).where("wars.user_1_id IS NOT NULL").uniq
		@games.each do |game|
			tab = []
			game.users.each do |u|
				hash = {:name => 0,  :score => 0,:w => 0,:l => 0,:n => 0}
				w = 0
				l = 0
				n = 0
				hash[:score] = game.wars.where(user_1_id: u.id,game_id: game.id).sum(:scorej1) + game.wars.where(user_2_id: u.id,game_id: game.id).sum(:scorej2)
				game.wars.where('user_1_id=? OR user_2_id=?', u.id,u.id).each do |sc|
					case sc.scorej1
						when 3
							sc.user_1_id == u.id ? hash[:w] +=1 : hash[:l] +=1
						when 0
							sc.user_1_id == u.id ? hash[:l]+=1 : hash[:w] +=1
						else hash[:n]+=1
						end
				end
				hash[:name] = u.name
				tab.push(hash)
			end
			tab.sort_by! { |m| m[:score]}.reverse!
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


