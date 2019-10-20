class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :travelled_distance_meter

      t.timestamps
    end
  end
end
