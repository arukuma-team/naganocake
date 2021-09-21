class Rename < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :image, :item_ima
  end
end
