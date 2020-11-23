class Project < ApplicationRecord
  has_many :proposals, dependent: :destroy
end
