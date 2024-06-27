class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.text :body, null: false
      t.text :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.timestamps
    end
  end
end
