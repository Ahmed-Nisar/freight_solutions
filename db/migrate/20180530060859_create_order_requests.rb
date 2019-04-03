class CreateOrderRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :order_requests do |t|
      t.references :user
      t.string :order_name
      t.string :quantity
      t.string :amount
      t.integer :status, default: 0
      t.string :country
      t.string :city
      t.string :house_num
      t.string :phone
      t.timestamps
    end
  end
end
