# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  phone_number :string
#  provider     :string
#  uid          :string
#  name         :string
#  email        :string
#  role         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ActiveRecord::Base

  has_many :orders
  has_many :order_shipping_addresses

  def self.from_omniauth(session_user_id, auth_hash)
    user = User.where(:email => auth_hash["info"]["email"]).first

    unless user
      if session_user_id
        user = User.find(session_user_id)
      else
        user = User.new
      end
      user.name = auth_hash["info"]["name"]
      user.email = auth_hash["info"]["email"]
      user.provider = auth_hash["provider"]
      user.uid = auth_hash["uid"]
      user.role = "registered"
      user.save!
    end
    return user
  end

  def cart
    return self.orders.where(status: 'cart').last || Order.create(status: 'cart', user: self)
  end

end
