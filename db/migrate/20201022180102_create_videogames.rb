class CreateVideogames < ActiveRecord::Migration[6.0]
  def change
    create_table :videogames do |t|
      t.string :platform
      t.string :title
      t.text :description
      t.date :release_date

      t.timestamps
    end
  end
end
