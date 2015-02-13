class TournoisController < ApplicationController
  before_action :set_tournoi, only: [:show, :edit, :update, :destroy, :register]

  respond_to :html

  def index
    if user_signed_in?
      @tournois = Tournoi.all
      respond_with(@tournois)
    else 
      redirect_to new_user_session_path
    end
  end

  def show
    set_tournoi
  end

  def new
    @tournoi = Tournoi.new
    @games = Game.all
    respond_with(@tournoi)
  end

  def edit
    @games = Game.all
  end

  def create
    @tournoi = Tournoi.new(tournoi_params)
    if @tournoi.save
      redirect_to root_path
    end
  end

  def update
    set_tournoi
    @games = Game.all
    if @tournoi.update_attributes(tournoi_params)
      redirect_to (@tournoi)
    end
  end

  def destroy
    @tournoi.tournoi_games.where("tournoi_id = ?",params[:id]).delete_all
    @tournoi.register_tournois.where("tournoi_id = ?",params[:id]).delete_all
    if @tournoi.destroy
      redirect_to root_path
    end
  end

  def register
    @register_tournoi = RegisterTournoi.new
    @register_tournoi.user_id = current_user.id
    @register_tournoi.tournoi_id = params[:id]
    if @tournoi.nbPlayerMax > @tournoi.users.count
      if @register_tournoi.save
        redirect_to root_path
      end
    end
  end

  private
    def set_tournoi
      @tournoi = Tournoi.find(params[:id])
    end

    def tournoi_params
      params.require(:tournoi).permit(:name, :place, :nbPlayerMax, :date, :game_ids => [])
    end

end
