class RenameItemIma < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :item_ima, :item_image
  end
end
