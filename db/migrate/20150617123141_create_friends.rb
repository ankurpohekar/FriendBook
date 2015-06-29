class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :image
      t.string :fname
      t.string :lname
      t.string :title 
      t.string :gender 
      t.string :mobile 
      t.string :email
      t.attachment :image
      t.timestamps null: false
    end
  end
end
