class CandidatesController < ApplicationController
  before_action :private_access

  def index
    @candidates = Candidate.all
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(params_candidate)
    @candidate.user_id = current_user.id
    
    if @candidate.save
      
      redirect_to @candidate
    else
      render :new       
    end
  end

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update(params_candidate)
      redirect_to candidates_path
    else
      render :edit
      
    end

  end

  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    redirect_to candidates_path
  end

  def proposals_candidate
    @candidate = Candidate.find(params[:id])
    
  end

  private
  def params_candidate
    params.require(:candidate).permit(:name,:last_name,:party,:description,:user_id)
    
  end
end
