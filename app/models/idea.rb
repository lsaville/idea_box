class Idea < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
  belongs_to :category

  has_many :ideas_images
  has_many :images, through: :ideas_images
end
