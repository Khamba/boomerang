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

  def self.from_omniauth(auth_hash)
    user = User.where(:email => auth_hash["info"]["email"]).first

    unless user
      if session[:user_id]
        user = User.find(session[:user_id])
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

end
