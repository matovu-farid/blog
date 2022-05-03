class ChangeUserIdTo < ActiveRecord::Migration[7.0]
  def change

    drop_table :likes
    create_table :likes do |t|
      t.references :author,null: false,  foreign_key: {to_table: :users}
      t.references :post,null: false,  foreign_key: true
      t.timestamps
    end
  end
end
