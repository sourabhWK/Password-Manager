class User < ApplicationRecord
  has_secure_password
  has_many :credentials, dependent: :destroy

  validates :email, presence: true

end
