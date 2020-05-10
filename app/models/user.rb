class User < ApplicationRecord
  has_many :microposts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :trackable
         # :omniauthable, omniauth_providers:[:twitter]

  mount_uploader :image, ImageUploader
  mount_base64_uploader :image, ImageUploader
end
