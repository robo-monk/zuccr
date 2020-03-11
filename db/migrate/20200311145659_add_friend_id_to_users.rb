class AddFriendIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :friend_id, :integer
  end
end
