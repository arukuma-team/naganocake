class AddTelToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :tel, :string
  end
end
