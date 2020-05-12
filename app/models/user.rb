class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
              foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
              foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :follewers, through: :passive_relationships, source: :follwer
  has_many :likes, dependent: :destroy
  has_many :my_likes, through: :likes, source: :micropost

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :trackable
         # :omniauthable, omniauth_providers:[:twitter]

  mount_uploader :image, ImageUploader
  mount_base64_uploader :image, ImageUploader

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def like(micropost)
    my_likes << micropost
  end

  def unlike(_micropost)
    likes.find_by(micropost_id: micropost.id).destroy
  end

  def like?(micropost)
    my_likes.include?(micropost)
  end
end
