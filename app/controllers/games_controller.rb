class GamesController < ApplicationController
	def new
		@game = Game.new
	end

	def create
		@game = current_user.games.new(game_params)
		@game.save
	end

	def index
    	@game = Game.all
  end

  def edit
  	@game = Game.find(params[:id])
  end
  	
  def destroy
  	@game.destroy
  end
  	
  def update
    @game = current_user.games.find(params[:id])
  	if @game.update_attributes(game_update)
      redirect_to (@game)
    end
  end

  def show 
    @game = Game.find(params[:id])
  end
  
	private

	def game_params
		params.require(:game).permit(:title, :description, :user_id)
	end
  def game_update
    params.require(:game).permit(:title, :description)
  end
end
