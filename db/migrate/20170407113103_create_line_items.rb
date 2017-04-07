class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|

      t.references :order
      t.references :product
      t.integer :price
      t.string :size
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
