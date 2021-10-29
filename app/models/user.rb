class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :goals
  has_many :likes, dependent: :destroy
  # has_many :like_posts, through: :likes, source: :goal

  # has_many :comments

  validates :nickname, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: 'は英字と数字の両方を含めて入力してください', allow_blank: true }
  with_options numericality: { other_than: 1, message: 'を選択して下さい' } do
    validates :age_id
    validates :sex_id
    validates :profession_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age
  belongs_to :sex
  belongs_to :profession
end
