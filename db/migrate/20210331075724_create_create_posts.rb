class CreateCreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :create_posts do |t|
      t.references :account, foreign_key: true
      t.string :image
      t.boolean :active

      t.timestamps
    end
  end
end
