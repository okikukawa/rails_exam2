class Article < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
end
