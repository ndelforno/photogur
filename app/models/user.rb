class User < ApplicationRecord

  has_many :pictures

  has_secure_password

  validates :email, presence: true


end
