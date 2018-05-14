class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :type_room, limit: 100, null: false, default: ""
      t.integer :quantity, null: false, default: 1
      t.datetime :check_in, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :check_out
      t.integer :status, limit: 1, null: false, default: 0
      t.integer :user_id
      t.integer :hotel_id
      t.timestamps
    end
    add_foreign_key :bookings, :users, column: :user_id, primary_key: "id"
    add_foreign_key :bookings, :hotels, column: :hotel_id, primary_key: "id"
    change_column :bookings, :id, :int, null: false, unique: true, auto_increment: true
    execute 'alter table bookings
              modify column status int(1) not null default 0;'
  end
end
