class AddLastnameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :lastname, :string
  end
end
