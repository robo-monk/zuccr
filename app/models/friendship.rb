class Friendship < ApplicationRecord
  belongs_to :one, class_name: 'User'
  belongs_to :other, class_name: "User"
end
