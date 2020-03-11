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

  has_many :out_friend_requests, class_name: 'FriendRequest', foreign_key: 'requester_id', dependent: :destroy
  has_many :in_friend_requests, class_name: 'FriendRequest', foreign_key: 'target_id', dependent: :destroy

  has_many :liked_posts, through: :likes, source: :post
  has_many :commented_posts, through: :comments, source: :post

  has_many :friendships, foreign_key: 'one_id'

end