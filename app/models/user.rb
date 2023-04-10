class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
