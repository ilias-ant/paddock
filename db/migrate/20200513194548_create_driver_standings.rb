class CreateDriverStandings < ActiveRecord::Migration[6.0]
  def change
    create_table :driver_standings do |t|
      t.integer :race_id, null: false
      t.integer :driver_id, null: false
      t.float :points, null: false
      t.integer :position
      t.string :position_text
      t.integer :wins, null: false

      t.timestamps
    end
  end
end
