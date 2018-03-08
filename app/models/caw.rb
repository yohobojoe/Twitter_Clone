class Caw < ApplicationRecord
  belongs_to :user

  validates :message, presence: true
  validates :message, length: {maximum: 160, too_long: "A caw is only 160 max characters."}
end
