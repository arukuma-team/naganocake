class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.string :price
      t.boolean :status
      t.string :image

      t.timestamps
    end
  end
end
