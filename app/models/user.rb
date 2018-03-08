class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  serialize :following, Array

  has_many :caws

  validates :username, presence: true
  validates :username, uniqueness: true

  mount_uploader :avatar, AvatarUploader
end
