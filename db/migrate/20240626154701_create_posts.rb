class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id, null: false
      t.integer :comment_id
      t.text :body, null: false
      t.text :tag_body
      t.float :lat, null: false
      t.float :lng, null: false
      t.timestamps
    end
  end
end
