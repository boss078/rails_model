class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :age_limit
      t.time :length
      t.integer :rating

      t.timestamps
    end
  end
end
