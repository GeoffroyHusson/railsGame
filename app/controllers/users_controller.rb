class UsersController < ApplicationController
	def edit
		 @user = current_user
	end

	def update
		@user = current_user
		if @user.update_attributes(user_params)
			s = Geocoder.search(@user.location.address)
			@user.location.address = s.first.data["formatted_address"]
			@user.save
				redirect_to root_path
		else
			render :action => 'edit'
		end
	end
	

	private 
		def user_params
			params.require(:user).permit(:email, :encrypted_password, :name,  location_attributes: [:address])
		end
		def location_params
			params.require(:user).permit(:locations_attributes)
		end
		
end
