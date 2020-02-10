class AddPropertyRefToNearStations < ActiveRecord::Migration[5.2]
  def change
    add_reference :near_stations, :property, foreign_key: true
  end
end
