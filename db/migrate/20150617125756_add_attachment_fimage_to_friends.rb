class AddAttachmentFimageToFriends < ActiveRecord::Migration
  def self.up
    change_table :friends do |t|
      t.attachment :fimage
    end
  end

  def self.down
    remove_attachment :friends, :fimage
  end
end
