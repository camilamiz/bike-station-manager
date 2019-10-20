class ChangeColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :trips, :origin_station_id_id, :origin_station_id
    rename_column :trips, :destiny_station_id_id, :destiny_station_id    
  end
end
