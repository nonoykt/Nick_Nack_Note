class Micropost < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
