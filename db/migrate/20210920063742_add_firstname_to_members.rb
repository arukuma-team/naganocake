class AddFirstnameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :firstname, :string
  end
end
