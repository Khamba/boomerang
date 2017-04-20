class CreateOrderShippingAddresses < ActiveRecord::Migration
  def change
    create_table :order_shipping_addresses do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :state
      t.string :city
      t.string :string
      t.string :zip
      t.text :address
      t.references :user, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
