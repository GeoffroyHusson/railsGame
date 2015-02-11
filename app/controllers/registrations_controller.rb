class RegistrationsController < Devise::RegistrationsController

	def create
		@user = User.new(sign_up_params)
		@user.statut = User::ADMIN
		if @user.save
			redirect_to root_path, :notice => "Inscription effectuée avec succès"
		else
			redirect_to new_user_registration_path, :notice => "Une erreur s'est produite, réessayez"
		end
	end
 
  private
 
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end