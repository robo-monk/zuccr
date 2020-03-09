class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :liked_posts, through: :likes, source: :post
  has_many :commented_posts, through: :comments, source: :post
end