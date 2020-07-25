class Post < ApplicationRecord
  belongs_to :spot
  belongs_to :user

  validates :title, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end