class CreatePitStops < ActiveRecord::Migration[6.0]
  def change
    create_table :pit_stops do |t|
      t.integer :race_id, null: false
      t.integer :driver_id, null: false
      t.integer :stop, null: false
      t.integer :lap, null: false
      t.string :time, null: false
      t.string :duration
      t.integer :milliseconds

      t.timestamps
    end
  end
end
