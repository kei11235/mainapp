class Goal < ApplicationRecord

  belongs_to :user
  # has_many :likes
  has_many :comments
  has_many :tasks
  has_many :completions
  
end
