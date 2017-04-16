class AddDaysToRentToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :days_to_rent, :integer
  end
end
