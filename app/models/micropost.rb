class Micropost < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likes_user, through: :likes, source: :user
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image, presence: true
  has_many :micropost_categories
  has_many :categories, through: :micropost_categories

  mount_uploader :image, ImageUploader
  mount_base64_uploader :image, ImageUploader

end
