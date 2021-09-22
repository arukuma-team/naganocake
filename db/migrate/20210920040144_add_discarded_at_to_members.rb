class AddDiscardedAtToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :discarded_at, :datetime, default: "false"
    add_index :members, :discarded_at
  end
end
