class ApplicationController < ActionController::Base
	def sign_in(user)
		cookies.permanent.signed[:user_id] = user.id
		@current_user = user 		
	end
	

	def sign_out
		cookies.delete(:user_id)
		@current = nil
	end 

	private
	def signed_in?
		!current_user.nil?
	end
	helper_method :signed_in?

	def current_user
		@current_user ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
	rescue ActiveRecord::RecordNotFound
	end
	helper_method :current_user

	def private_access
		redirect_to :login unless signed_in?		
	end

	def public_access
		if signed_in?
			if current_user.votes.empty?
				redirect_to candidates_path
			else
				redirect_to root_path 
			end
		end
	end

	
	

end
