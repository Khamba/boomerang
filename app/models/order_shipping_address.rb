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

class OrderShippingAddress < ActiveRecord::Base
  belongs_to :user
  belongs_to :order

  validates :name, presence: true
  validates_format_of :email, presence: true, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'should be of proper format.'
  validates_format_of :phone_number, with: /\A[0-9]{10}\z/, message: 'should be 10 digits'
  validates :state, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates_format_of :zip, with: /\A[0-9]{4,7}\z/, message: 'should be 4-7 digits'

end
