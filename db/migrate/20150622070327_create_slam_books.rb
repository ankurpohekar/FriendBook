class CreateSlamBooks < ActiveRecord::Migration
  def change
    create_table :slam_books do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :status
      t.string :name
      t.string :lname
      t.string :hobby
      t.string :email
      t.string :mobile

      t.timestamps null: false
    end
  end
end
