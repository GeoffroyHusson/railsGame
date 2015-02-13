class User < ActiveRecord::Base
  has_many :games
  has_many :tournois, through: :register_tournois 
#  has_many :tournois, through: :wars
  has_many :register_tournois
  
  has_many :primary_wars, :class_name => "War", :foreign_key => "user_1_id"
  has_many :secondary_wars, :class_name => "War", :foreign_key => "user_2_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable ,:omniauthable, :omniauth_providers => [:facebook]
  before_save :get_statut, only: [:create]
  #DEFINE
  ADMIN = 1 
  USER = 2

  def admin?
  	self.statut == ADMIN
  end

  def get_statut
 	  self.statut = ADMIN
 end
end
