class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :races, :seasons, column: :year, primary_key: 'year'
    add_foreign_key :races, :circuits
    add_foreign_key :constructor_results, :constructors
    add_foreign_key :constructor_results, :races
    add_foreign_key :constructor_standings, :constructors
    add_foreign_key :constructor_standings, :races
    add_foreign_key :driver_standings, :drivers
    add_foreign_key :driver_standings, :races
    add_foreign_key :lap_times, :drivers
    add_foreign_key :lap_times, :races
    add_foreign_key :pit_stops, :drivers
    add_foreign_key :pit_stops, :races
    add_foreign_key :qualifyings, :constructors
    add_foreign_key :qualifyings, :drivers
    add_foreign_key :qualifyings, :races
    add_foreign_key :results, :constructors
    add_foreign_key :results, :drivers
    add_foreign_key :results, :races
    add_foreign_key :results, :statuses
  end
end
