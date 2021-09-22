class RenameItemImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :item_image, :picture
  end
end
