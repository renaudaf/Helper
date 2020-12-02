class Project < ApplicationRecord
  belongs_to :user
  has_many :proposals, dependent: :destroy
  has_many :project_tags, dependent: :destroy
  has_many :tags, through: :project_tags
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :title, presence: true
  after_commit :reject_empty_measures, on: %i[create update]
  after_commit :accepted, default: true

  include AlgoliaSearch

  def reject_empty_measures
    new_measurements = self.measurements.reject do |measurement|
      measurement["name"].empty?
    end
    self.measurements = new_measurements
  end

  algoliasearch do
    attributes :title, :tags_name, :address, :latitude, :longitude
    # all attributes will be sent
  end

  private

  def tags_name
    tags.pluck(:name)
  end
end
