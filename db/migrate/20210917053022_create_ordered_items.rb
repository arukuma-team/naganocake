class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :piece
      t.enum :making_status
      t.integer :price_taxin

      t.timestamps
    end
  end
end
