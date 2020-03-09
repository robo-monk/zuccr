class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :email, uniqueness: true
  validates :name, presence: true

  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :liked_posts, through: :likes, source: :post
  has_many :commented_posts, through: :comments, source: :post
end