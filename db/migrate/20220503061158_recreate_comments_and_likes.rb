class RecreateCommentsAndLikes < ActiveRecord::Migration[7.0]
  def change
    drop_table :comments
    drop_table :likes
    create_table :comments do |t|
      t.references :author, null: false, foreign_key: {to_table: :users}
      t.references :post, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: {to_table: :users}
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
