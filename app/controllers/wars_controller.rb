class WarsController < ApplicationController
	before_action :set_action, only: [:index, :show, :new, :create]
	respond_to :html

	def index
		@war = War.new
	end
	def show
		@war = War.new
	end
	def new
		@war = War.new
	end

	def create
		@war = War.new(war_params)
		@war.tournoi_id = @tournoi.id
		if @war.save
			redirect_to tournoi_path(@tournoi)
		end
	end

	def update
		@war = War.find(params[:id])
		 if @war.update_attributes(tournoi_params)
      		redirect_to (@tournoi)
   		 end
	end

	private
		def war_params
			params.require(:war).permit(:user_1_id, :user_2_id, :tournoi_id, :game_id )
		end


		def war_update
			params.require(:war).permit(:scoreJ1, :scoreJ2)
		end

		def set_action
			@tournoi = Tournoi.find(params[:tournoi_id])
		end
end
