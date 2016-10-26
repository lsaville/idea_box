class User < ActiveRecord::Base
  validates :user_name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates_confirmation_of :password
  has_many :ideas
end
