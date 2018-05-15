class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name, limit: 155, null: false, default: ""

      t.timestamps
    end
    change_column :cities, :id, :int, null: false, unique: true, auto_increment: true
  end
end
