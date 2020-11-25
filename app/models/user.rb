class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :proposals, dependent: :destroy
  has_many :reviewer_reviews, class_name: 'Review', foreign_key: 'reviewer_id', dependent: :destroy
  has_many :helper_reviews, class_name: 'Review', foreign_key: 'helper_id', dependent: :destroy
end
