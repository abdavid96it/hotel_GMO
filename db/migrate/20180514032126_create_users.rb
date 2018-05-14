class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 100, null: false, default: ""
      t.integer :status
      t.string :phone, limit: 12, null: false, default: ""
      t.integer :approved
      t.integer :gender
      t.string :avatar
      t.integer :role

      t.timestamps
    end
    change_column :users, :id, :int, null: false, unique: true, auto_increment: true
    execute 'alter table users
              modify column status int(1) not null default 0,
              modify column approved int(1) not null default 0,
              modify column gender int(1) not null default 0,
              modify column role int(1) not null default 0;'
  end
end
