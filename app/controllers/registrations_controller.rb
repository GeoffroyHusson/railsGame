class RegistrationsController < Devise::RegistrationsController
	def update
		super
		#@user.location = User.location.find_by_user_id(params[:id])
		#@user.location.update_attributes(params_location)
	end
	
 
  private
 	def params_location
 		params.require(:location).permit(:address)
 	end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation , :statut)
  end
 
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :address)
  end
end