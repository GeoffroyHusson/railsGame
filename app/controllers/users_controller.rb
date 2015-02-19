class UsersController < ApplicationController

	def edit
		 @user = current_user
		 @location = @user.build_location
	end

	def update
		@user = current_user
		if @user.update_attributes(user_params)
			if current_user.build_location(location_params)
				redirect_to root_path
			end
		else
			render :action => 'edit'
		end
	end
	

	private 
		def user_params
			params.require(:user).permit(:email, :encrypted_password, :name, :location_attributes)
		end
		def location_params
			params.require(:user).permit(:locations_attributes)
		end
		
end
