class Candidate < ApplicationRecord
  belongs_to :user
  has_many :proposals
  has_many :votes

  def voted_by?(user)
  	votes.exists?(user:user)  	
  end


end
