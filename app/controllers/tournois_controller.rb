class TournoisController < ApplicationController
  before_action :set_tournoi, only: [:show, :edit, :update, :destroy]

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
    respond_with(@tournoi)
  end

  def new
    @tournoi = Tournoi.new
    respond_with(@tournoi)
  end

  def edit
  end

  def create
    @tournoi = Tournoi.new(tournoi_params)
    @tournoi.save
    respond_with(@tournoi)
  end

  def update
    @tournoi.update(tournoi_params)
    respond_with(@tournoi)
  end

  def destroy
    @tournoi.destroy
    respond_with(@tournoi)
  end

  private
    def set_tournoi
      @tournoi = Tournoi.find(params[:id])
    end

    def tournoi_params
      params.require(:tournoi).permit(:name, :place, :nbPlayerMax, :date)
    end
end
