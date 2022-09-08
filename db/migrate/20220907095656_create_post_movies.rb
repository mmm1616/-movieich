class CreatePostMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :post_movies do |t|
      t.integer :user_id, null: false
      t.integer :situation_id, null: false
      t.string :title, null: false
      t.text :story, null: false
      t.text :review, null: false
      t.integer :site, null: false, default: 0

      t.timestamps
    end
  end
end
