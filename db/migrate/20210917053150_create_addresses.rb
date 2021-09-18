class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :member_id
      t.integer :zip
      t.text :address
      t.string :name

      t.timestamps
    end
  end
end
