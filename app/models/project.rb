class Project < ApplicationRecord
  has_many :proposals, dependent: :destroy
  has_many :project_tags, dependent: :destroy
  has_many :tags, through: :project_tags
  has_many_attached :photos

  belongs_to :user

  validates :title, presence: true
  after_commit :reject_empty_measures

  def reject_empty_measures
    self.measurements = self.measurements.reject do |measurement|
      measurement["name"].empty?
    end
  end
end

# measurements = [{:name , :dimension]
