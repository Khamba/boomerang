# == Schema Information
#
# Table name: order_shipping_addresses
#
#  id           :integer          not null, primary key
#  name         :string
#  email        :string
#  phone_number :string
#  state        :string
#  city         :string
#  string       :string
#  zip          :string
#  address      :text
#  user_id      :integer
#  order_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class OrderShippingAddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
