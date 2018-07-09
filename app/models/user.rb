class User < ApplicationRecord
  has_many :voters
  has_many :candidates
  has_many :proposals
  has_many :votes
  has_secure_password validations: false
end
