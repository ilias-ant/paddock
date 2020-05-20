class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.bigint :race_id, null: false
      t.bigint :driver_id, null: false
      t.bigint :constructor_id, null: false
      t.integer :number
      t.integer :grid, null: false
      t.integer :position
      t.string :position_text, null: false
      t.integer :position_order, null: false
      t.float :points, null: false
      t.integer :laps, null: false
      t.string :time
      t.integer :milliseconds
      t.integer :fastest_lap
      t.integer :rank
      t.string :fastest_lap_time
      t.string :fastest_lap_speed
      t.bigint :status_id, null: false

      t.timestamps
    end
  end
end
