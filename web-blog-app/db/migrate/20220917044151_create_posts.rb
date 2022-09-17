class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :tittle
      t.text :post_body
      t.string :source

      t.timestamps
    end
  end
end
