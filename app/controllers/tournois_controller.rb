class TournoisController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  before_action :acces_admin, only: [:edit,:show, :edit, :update, :destroy]
  before_action :set_tournoi, only: [:show, :edit, :update, :destroy, :register]

  #before_action :check_wars_blank, only: [:update, :edit]
  #respond_to :html

  def index
    if user_signed_in?
      @tournois = Tournoi.all
      @user = current_user
    else 
      redirect_to new_user_session_path
    end
  end

  def show
    set_tournoi
    @game = Game.all
  end

  def new
    @tournoi = Tournoi.new
    @games = Game.all
    1.times { @tournoi.build_location }
  end

  def edit
      @gamesNotUsed = @tournoi.wars.pluck(:game_id).uniq
      @gamesUsed = Game.where(id: @gamesNotUsed)
      @games = Game.where.not(id: @gamesNotUsed)
      authorize! :edit, @tournoi if can? :edit, @tournoi
  end

  def create
    @tournoi = Tournoi.new(tournoi_params)
    @war = @tournoi.wars
    @games = Game.all
    if @tournoi.save
      flash[:notice] = "Tournoi créé avec succès"
      redirect_to root_path
     else
      render :action => 'new'
    end
  end

  def update
    @games = Game.all
    if @tournoi.update_attributes(tournoi_params)
      redirect_to (@tournoi)
    end
  end

  def destroy
    @tournoi.tournoi_games.where("tournoi_id = ?",params[:id]).delete_all
    @tournoi.register_tournois.where("tournoi_id = ?",params[:id]).delete_all
    if @tournoi.destroy
      flash[:notice] = "Le tournoi a été supprimé avec succès"
      redirect_to root_path
    end
  end

  def register
    @register_tournoi = RegisterTournoi.new
    @register_tournoi.user_id = current_user.id
    @register_tournoi.tournoi_id = params[:id]
    if @tournoi.nbPlayerMax > @tournoi.users.count && @register_tournoi.save
        redirect_to root_path
    else 
       flash[:warning] = "Vous ne pouvez pas vous enregistrer ou réenregistrer à ce tournoi"
      redirect_to root_path
    end
  end

  private
    def set_tournoi
      @tournoi = Tournoi.find(params[:id])
    end

    def tournoi_params
      params.require(:tournoi).permit(:name, :place, :nbPlayerMax, :date, location_attributes: [:address], :game_ids => [])
    end

    def acces_admin
      current_user.admin?
    end
    def check_wars_blank
      unless @tournoi.wars.blank?
        flash[:notice] = "Ce tournoi a déjà des matchs en cours ou cloturés, il ne peut être édité."
        redirect_to tournoi_path
      end
    end
end
