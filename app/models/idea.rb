class Idea < ActiveRecord::Base
  validates :name, presence: true

  has_many :images, through: :ideas_images
  belongs_to :user
  belongs_to :category
end
