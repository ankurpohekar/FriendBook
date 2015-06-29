class AddSlamBookStatusToFriendRequests < ActiveRecord::Migration
  def change
    add_column :friend_requests, :slam_book_status, :string
  end
end
