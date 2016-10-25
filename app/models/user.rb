class User < ActiveRecord::Base
  validates :user_name, :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :ideas
end
