class CreateTextPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :text_posts do |t|
      t.references :user_profile, foreign_key: true
      t.string :title
      t.text :content
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
