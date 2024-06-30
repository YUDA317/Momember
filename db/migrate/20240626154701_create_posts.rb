class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.text :body, null: false
      t.text :address, null: false
      t.float :lat, null: false
      t.float :lng, null: false
      t.timestamps
    end
  end
end
