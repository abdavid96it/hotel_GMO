class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name, limit: 100
      t.string :email, limit: 50
      t.string :phone, limit: 12
      t.string :address
      t.string :copyright
      t.text :description

      t.timestamps
    end
    execute 'alter table contacts
              modify column id int(1) not null auto_increment;'
  end
end
