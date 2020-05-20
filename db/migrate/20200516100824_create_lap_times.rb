class CreateLapTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :lap_times do |t|
      t.bigint :race_id, null: false
      t.bigint :driver_id, null: false
      t.integer :lap, null: false
      t.integer :position
      t.string :time
      t.integer :milliseconds

      t.timestamps
    end
  end
end
