class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.integer :year, null: false
      t.string :url, null: false

      t.timestamps

      t.index :year, unique: true
    end
  end
end
