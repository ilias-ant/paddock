class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|
      t.integer :year, null: false
      t.integer :round, null: false
      t.bigint :circuit_id, null: false
      t.string :name, null: false
      t.date :date, null: false
      t.time :time
      t.string :url

      t.timestamps
    end
  end
end
