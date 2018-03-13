class Tag < ApplicationRecord
  has_many :caw_tags
  has_many :caws, through: :caw_tags
end
