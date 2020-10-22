class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :left_on_warehouse

      t.timestamps
    end
  end
end
