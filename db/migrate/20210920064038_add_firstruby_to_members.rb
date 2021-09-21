class AddFirstrubyToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :firstruby, :string
  end
end
