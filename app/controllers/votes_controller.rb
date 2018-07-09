class VotesController < ApplicationController

	def index
		
	end

	def new 
		@vote =Vote.new
		@candidates = Candidate.all
		
	end
	def create
		candidate = Candidate.find(params[:candidate_id])
		candidate.votes.create(user: current_user)
		redirect_to root_path
	end

	def destroy
		candidate = Candidate.find(params[:candidate_id])
		candidate.votes.where(user: current_user).take.try(:destroy)
		redirect_to candidates_path
	end

	def vote_consummate
		
	end
end
# lo que hace es al devolver un array la sentencia product.votes.where(user: current_user),
# product.votes.where(user: current_user).take.try(:destroy) , 
# 'take' toma el primer elemento y
#  'try' verifica que ese elemento no sea nil para que la aplicación no se muera.