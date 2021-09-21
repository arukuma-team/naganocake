class AddLastrubyToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :lastruby, :string
  end
end
