class RemoveDiscardedAtFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :discarded_at, :datetime
  end
end
