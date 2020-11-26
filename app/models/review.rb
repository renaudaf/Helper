class Review < ApplicationRecord
  belongs_to :reviewer, :class_name => 'User', :foreign_key => 'reviewer_id'
  belongs_to :helper, :class_name => 'User', :foreign_key => 'helper_id'

  # validates :content, :rating, presence: true
  # validates :rating, inclusion: { in: 1..5,
  #   message: "%{value} is not a valid rating" }
  # validates :rating, numericality: true
end
