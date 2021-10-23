class Rename < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :image, :item_image
  end
end
