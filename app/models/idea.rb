class Idea < ActiveRecord::Base
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :category
end
