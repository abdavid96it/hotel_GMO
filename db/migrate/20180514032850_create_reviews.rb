class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.float :score, null: false, default: 10
      t.text :comment
      t.integer :user_id
      t.integer :hotel_id

      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :user_id, primary_key: "id"
    add_foreign_key :reviews, :hotels, column: :hotel_id, primary_key: "id"
  end
end
