class SessionsController < ApplicationController
  before_action :public_access, except: [:destroy]
  def new
  	@roles = Role.all
  end

  def create
  	user = User.find_by(email: params[:email], role_id: params[:role_id]) 


    if user && user.authenticate(params[:password]) 
  		sign_in(user)
      if user.role_id == 1
        redirect_to admin_path  
      elsif user.role_id == 2
        if user.candidates.empty?
          redirect_to new_candidate_path
        else
          if current_user.votes.empty?
            redirect_to candidates_path
          else
            redirect_to consummate_path
          end
        end
        
      else    
        if user.voters.empty?
          redirect_to new_voter_path
        else
          if current_user.votes.empty?
            redirect_to candidates_path
          else
            redirect_to consummate_path
          end
          
        end
      end 
  	else
  		redirect_to logi_incorrect_path

  	end
  end

  def no_exist
  	
  end

  def destroy
  	sign_out
  	redirect_to root_path  	
  end


end
