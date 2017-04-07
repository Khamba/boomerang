# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  name            :string
#  rent_price      :integer
#  actual_price    :integer
#  sizes_available :string           default([]), is an Array
#  description     :text
#  images          :json
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Product < ActiveRecord::Base

  mount_uploaders :images, ImageUploader

  SIZES = [ 'S', 'M', 'L', 'XL' ]

  has_many :product_categories, dependent: :destroy
  accepts_nested_attributes_for :product_categories
  has_many :categories, through: :product_categories
  has_many :line_items
  has_many :orders, through: :line_items

  validates_presence_of :name
  validates :rent_price, numericality: { greater_than: 0, integer: true }
  validates :actual_price, numericality: { greater_than: 0, integer: true }
  validate :at_least_one_size_is_available
  validate :valid_sizes_available_array
  validate :at_least_one_image

  private

    def at_least_one_size_is_available
      unless sizes_available.is_a?(Array) && sizes_available.length > 0
        errors.add(:sizes_available, 'at least one size must be available')
      end
    end

    def valid_sizes_available_array
      if sizes_available.detect{|s| !SIZES.include?(s)}
        errors.add(:sizes_available, :invalid)
      end
    end

    def at_least_one_image
      if self.images.empty?
        errors.add(:images, 'at least one image must be present')
      end
    end

end
