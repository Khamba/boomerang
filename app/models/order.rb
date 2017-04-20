# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  status        :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  delivery_date :date
#

class Order < ActiveRecord::Base

  has_many :line_items
  has_many :products, through: :line_items
  belongs_to :user
  has_one :order_shipping_address

  def add_item(item_attributes)
    if self.status == 'cart'
      item_attributes = HashWithIndifferentAccess.new(item_attributes)
      self.line_items.where(product_id: item_attributes[:product_id]).destroy_all
      return self.line_items.create(item_attributes)
    else
      return false
    end
  end

  def remove_item(line_item_id)
    self.line_items.where(id: line_item_id).destroy_all
  end

  def empty?
    return self.line_items.count == 0
  end

  def subtotal
    return self.line_items.map { |item| item.price }.sum
  end

  def shipping
    return 0 # free
  end

  def total
    self.subtotal + shipping
  end

end
