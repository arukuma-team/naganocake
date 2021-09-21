class AddStatusToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :status, :boolean
  end
end
