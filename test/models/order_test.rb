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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
