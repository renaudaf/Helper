class Project < ApplicationRecord
  has_many :proposals, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
end
