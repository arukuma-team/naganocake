class RemoveCartItemsFromPrice < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :price, :integer
    add_column :cart_items, :piece, :integer
  end
end
