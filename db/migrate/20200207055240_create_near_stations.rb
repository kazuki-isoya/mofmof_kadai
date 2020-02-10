class CreateNearStations < ActiveRecord::Migration[5.2]
  def change
    create_table :near_stations do |t|
      t.string :route
      t.string :name
      t.integer :walk_time

      t.timestamps
    end
  end
end
