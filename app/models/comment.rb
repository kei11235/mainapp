class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :goal

  validates :text, presence: true
end
