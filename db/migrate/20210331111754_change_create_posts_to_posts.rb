class ChangeCreatePostsToPosts < ActiveRecord::Migration[5.2]
  def change
  	rename_table :create_posts, :posts
  end
end
