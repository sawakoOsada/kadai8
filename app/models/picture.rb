class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 60000 }
  belongs_to :user
end
