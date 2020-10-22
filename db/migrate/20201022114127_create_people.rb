class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.integer :age
      t.date :date_of_birth
      t.text :biography

      t.timestamps
    end
  end
end
