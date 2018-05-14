class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :name, null: false, default: ""
      t.integer :avatar, limit: 1, null: false, default: 0
      t.integer :hotel_id
      t.integer :contact_id

      t.timestamps
    end
    add_foreign_key :images, :hotels, column: :hotel_id, primary_key: "id"
    add_foreign_key :images, :contacts, column: :contact_id, primary_key: "id"
    change_column :images, :id, :int, null: false, unique: true, auto_increment: true
    execute 'alter table images
              modify column avatar int(1) not null default 0;'
  end
end
