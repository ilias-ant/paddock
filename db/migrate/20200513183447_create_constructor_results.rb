class CreateConstructorResults < ActiveRecord::Migration[6.0]
  def change
    create_table :constructor_results do |t|
      t.bigint :race_id, null: false
      t.bigint :constructor_id, null: false
      t.float :points
      t.string :status

      t.timestamps
    end
  end
end
