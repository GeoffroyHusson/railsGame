class WarsController < ApplicationController
	before_action :set_action, only: [:index, :show, :new, :create]
	skip_before_filter :verify_authenticity_token, :only => [:update]

	#respond_to :html

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
		else
			flash[:error] = "Le formulaire a été mal complété"
    		render :action => :new
		end
	end

	def update
		@war = War.find(params[:id])
		@war.update_attributes(war_update)

		render json: "OK"
		 #if @war.update_attributes(war_update)
      	#	redirect_to (@war.tournoi)
   		 #end
	end

	private
		def war_params
			params.require(:war).permit(:user_1_id, :user_2_id, :tournoi_id, :game_id )
		end


		def war_update
			params.require(:war).permit(:scorej1, :scorej2)
		end

		def set_action
			@tournoi = Tournoi.find(params[:tournoi_id])
		end
end
