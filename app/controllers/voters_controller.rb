class VotersController < ApplicationController
  before_action :private_access
  def index
  	@voters = Voter.all
  end

  def show
  	@voter = Voter.find(params[:id])
  end

  def new
  	@voter = Voter.new
  end

  def create
  	@voter = Voter.new(params_voter)
  	@voter.role_id = current_user.role_id
  	@voter.user_id = current_user.id
  	if @voter.save
  		redirect_to candidates_path
  	else
  		render :new  		
  	end
  	
  end

  def edit
  	@voter = Voter.find(params[:id])
  end

  def update
  	@voter = Voter.find(params[:id])
  	if @voter.update(params_voter)
  		redirect_to @voter
  	else
  		render :edit
  	end
  	
  end

  def destroy
  	voter = Voter.find(params[:id])
  	voter.destroy
  	redirect_to voters_path
  	
  end

  private
  def params_voter
  	params.require(:voter).permit(:name,:last_name,:birht,:cedula,:role_id,:user_id)  	
  end
end
