class RenameItemPicture < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :picture, :picture_id
  end
end
