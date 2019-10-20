class AddReferencesToTrip < ActiveRecord::Migration[5.2]
  def change
    add_reference :trips, :bike, foreign_key: true
    add_reference :trips, :user, foreign_key: true
    add_reference :trips, :origin_station_id, foreign_key: { to_table: :stations }
    add_reference :trips, :destiny_station_id, foreign_key: { to_table: :stations }
  end
end
