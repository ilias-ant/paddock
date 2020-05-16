class CreateQualifyings < ActiveRecord::Migration[6.0]
  def change
    create_table :qualifyings do |t|
      t.integer :race_id, null: false
      t.integer :driver_id, null: false
      t.integer :constructor_id, null: false
      t.integer :number, null: false
      t.integer :position
      t.string :q1
      t.string :q2
      t.string :q3

      t.timestamps
    end
  end
end
