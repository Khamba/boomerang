# == Schema Information
#
# Table name: line_items
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  product_id   :integer
#  price        :integer
#  size         :string
#  quantity     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  days_to_rent :integer
#

class LineItem < ActiveRecord::Base

  belongs_to :product
  belongs_to :order

  before_create do
    self.price = self.product.rent_price
  end

end
