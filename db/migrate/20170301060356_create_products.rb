class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :rent_price
      t.integer :actual_price
      t.string :sizes_available, array: true, default: []
      t.text :description
      t.json :images

      t.timestamps null: false
    end
  end
end
