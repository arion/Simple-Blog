class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
    
    add_index :posts, :user_id
    add_index :posts, :category_id
  end

  def self.down
    remove_index :posts, :category_id
    remove_index :posts, :user_id
    mind
    drop_table :posts
  end
end
