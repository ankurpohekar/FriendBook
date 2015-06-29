class AddFriendRequestIdToSlamBooks < ActiveRecord::Migration
  def change
    add_column :slam_books, :friend_request_id, :integer
  end
end
