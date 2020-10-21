class CreateAmongUsPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :among_us_players do |t|
      t.string :nickname
      t.boolean :is_imposter
      t.integer :completed_tasks

      t.timestamps
    end
  end
end
