class FriendRequest < ApplicationRecord
  belongs_to :target, class_name: "User"
  belongs_to :requester, class_name: "User"
end
