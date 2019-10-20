class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.integer :capacity

      t.timestamps
    end
  end
end
