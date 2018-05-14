class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name, limit: 155, null: false, default: ""
      t.string :phone, limit: 12, null: false, default: ""
      t.string :address, null: false, default: ""
      t.integer :price, null: false, default: 0
      t.text :description
      t.integer :status
      t.integer :rate
      t.integer :total_view
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.integer :city_id

      t.timestamps
    end
    add_foreign_key :hotels, :users, column: :user_id, primary_key: "id"
    add_foreign_key :hotels, :cities, column: :city_id, primary_key: "id"
    change_column :hotels, :id, :int, null: false, unique: true, auto_increment: true
    execute 'alter table hotels
              modify column status int(1) not null default 0,
              modify column rate int(1);'
  end
end
