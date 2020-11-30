class Project < ApplicationRecord
  has_many :proposals, dependent: :destroy
  has_many :project_tags, dependent: :destroy
  has_many :tags, through: :project_tags
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user

  validates :title, presence: true
  after_commit :reject_empty_measures

  include AlgoliaSearch

  def reject_empty_measures
    self.measurements = self.measurements.reject do |measurement|
      measurement["name"].empty?
    end
  end

  algoliasearch  do
    attributes :title, :tags_name
    # all attributes will be sent
  end

  private

  def tags_name
    tags.pluck(:name)
  end
end
