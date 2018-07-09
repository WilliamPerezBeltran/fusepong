class UsersController < ApplicationController
	before_action :public_access

	def view_admin
		
	end

	def new
		@user = User.new
		@roles = Role.all
	end

	def create
		@user = User.new(params_user)
		@roles = Role.all
		if @user.save
			redirect_to root_path
		else
			render :new			
		end

		
	end

	private
	def params_user
		params.require(:user).permit(:name,:email,:password,:role_id)
		
	end
end
