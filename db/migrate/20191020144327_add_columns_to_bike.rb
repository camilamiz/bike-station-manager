class AddColumnsToBike < ActiveRecord::Migration[5.2]
  def change
    add_reference :bikes, :station, foreign_key: true
    add_reference :bikes, :bike_status, foreign_key: true    
  end
end
