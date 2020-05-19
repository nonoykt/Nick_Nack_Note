class Category < ApplicationRecord
  has_many :micropost_categories, dependent: :destroy
  has_many :microposts, through: :micropost_categories
end
