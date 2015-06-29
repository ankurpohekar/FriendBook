class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :fname
      t.string :lname
      t.string :hobby
      t.integer :friend_request_id

      t.timestamps null: false
    end
  end
end
