class AddColumnToStation < ActiveRecord::Migration[5.2]
  def change
    add_column :stations, :neighborhood, :string
  end
end
