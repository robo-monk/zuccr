class AddOneIdAndOtherIdToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :one_id, :integer
    add_column :friendships, :other_id, :integer
  end
end
