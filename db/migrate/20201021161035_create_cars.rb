class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.date :release_date
      t.string :license_plate

      t.timestamps
    end
  end
end
