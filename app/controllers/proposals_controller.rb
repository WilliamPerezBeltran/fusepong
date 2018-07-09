class ProposalsController < ApplicationController
	
	def create
		#candidato que le queremos agregar una propuesta 
		candidate = Candidate.find(params[:candidate_id])
		candidate.proposals.create(params_proposal)
		redirect_to candidate
	end

	private
	def params_proposal
		params.require(:proposal).permit(:title,:description).merge(user: current_user)
	end
end
