class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates_confirmation_of :password

  has_many :ideas

  has_secure_password
end
