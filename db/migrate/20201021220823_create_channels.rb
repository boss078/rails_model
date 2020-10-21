class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.string :title
      t.string :streaming_platform
      t.integer :subscribers

      t.timestamps
    end
  end
end
