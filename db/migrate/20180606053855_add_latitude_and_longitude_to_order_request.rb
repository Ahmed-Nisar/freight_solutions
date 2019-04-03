class AddLatitudeAndLongitudeToOrderRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :order_requests, :latitude, :float
    add_column :order_requests, :longitude, :float
  end
end
