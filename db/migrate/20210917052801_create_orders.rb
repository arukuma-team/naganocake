class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :shipping_fee
      t.integer :order_amount
      t.string :payment_method
      t.string :delivery_name
      t.text :delivery_address
      t.integer :delivery_zip
      t.integer :order_status

      t.timestamps
    end
  end
end
