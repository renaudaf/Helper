class Proposal < ApplicationRecord
  has_many :messages
  belongs_to :project
  belongs_to :user
end
