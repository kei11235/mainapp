class Goal < ApplicationRecord

  belongs_to :user
  # has_many :likes
  # has_many :comments, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :completions, dependent: :destroy

  validates :targetm, presence: true
  validates :time, presence: true
end
