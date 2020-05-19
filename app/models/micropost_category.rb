class MicropostCategory < ApplicationRecord
  belongs_to :micropost
  belongs_to :category
end
