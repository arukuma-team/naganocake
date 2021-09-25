class RemoveMenbersFromStatus < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :status, :boolean
  end
end
