class User < ApplicationRecord
  has_many :authentications, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
