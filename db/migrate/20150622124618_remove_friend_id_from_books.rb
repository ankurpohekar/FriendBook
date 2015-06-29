class RemoveFriendIdFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :friend_id, :integer
  end
end
