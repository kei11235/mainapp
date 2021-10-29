class Goal < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  # has_many :users, through: :likes
  # has_many :comments, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :completions, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  validates :targetm, presence: true
  validates :time, presence: true
end
