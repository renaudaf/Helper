class Review < ApplicationRecord
  belongs_to :reviewer, :class_name => 'User', :foreign_key => 'reviewer_id'
  belongs_to :helper, :class_name => 'User', :foreign_key => 'helper_id'
end
