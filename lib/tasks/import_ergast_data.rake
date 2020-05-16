# frozen_string_literal: true

require 'activerecord-import/base'
require 'activerecord-import/active_record/adapters/postgresql_adapter'
require 'csv'

namespace :db do
  desc 'import F1 historic data into the database from CSVs'
  task import_ergast_data: :environment do
    puts "Importing Ergast historic data into the #{Rails.env} database. This may take a while..."

    data_loc = 'public/ergast_data/'

    # import seasons
    seasons_cols = %i[year url]
    seasons = CSV.parse(File.read(data_loc + 'seasons.csv'),
                        headers: true, return_headers: false).map(&:fields)

    Season.import seasons_cols, seasons, validate: false

    # import circuits
    circuits_cols = %i[id nickname name location country lat lng alt url]
    circuits = CSV.parse(File.read(data_loc + 'circuits.csv'),
                         headers: true, return_headers: false).map(&:fields)

    Circuit.import circuits_cols, circuits, validate: false

    # import constructors
    constructors_cols = %i[id nickname name nationality url]
    constructors = CSV.parse(File.read(data_loc + 'constructors.csv'),
                             headers: true, return_headers: false).map(&:fields)

    Constructor.import constructors_cols, constructors, validate: false

    # import drivers
    drivers_cols = %i[id nickname number code forename surname dob nationality url]
    drivers = CSV.parse(File.read(data_loc + 'drivers.csv'),
                        headers: true, return_headers: false).map(&:fields)

    Driver.import drivers_cols, drivers, validate: false

    # import constructor results
    constructor_results_cols = %i[id race_id constructor_id points status]
    constructor_results = CSV.parse(File.read(data_loc + 'constructor_results.csv'),
                                    headers: true, return_headers: false).map(&:fields)

    ConstructorResult.import constructor_results_cols, constructor_results, validate: false

    # import constructor standings
    constructor_standings_cols = %i[id race_id constructor_id points position position_text wins]
    constructor_standings = CSV.parse(File.read(data_loc + 'constructor_standings.csv'),
                                      headers: true, return_headers: false).map(&:fields)

    ConstructorStanding.import constructor_standings_cols, constructor_standings, validate: false

    # import driver standings
    driver_standings_cols = %i[id race_id driver_id points position position_text wins]
    driver_standings = CSV.parse(File.read(data_loc + 'driver_standings.csv'),
                                 headers: true, return_headers: false).map(&:fields)

    DriverStanding.import driver_standings_cols, driver_standings, validate: false

    # import races
    races_cols = %i[id year round circuit_id name date time url]
    races = CSV.parse(File.read(data_loc + 'races.csv'),
                      headers: true, return_headers: false).map(&:fields)

    Race.import races_cols, races, validate: false

    # import lap times
    lap_times_cols = %i[race_id driver_id lap position time milliseconds]
    lap_times = CSV.parse(File.read(data_loc + 'lap_times.csv'),
                          headers: true, return_headers: false).map(&:fields)

    LapTime.import lap_times_cols, lap_times, validate: false

    # import pit stops
    pit_stops_cols = %i[race_id driver_id stop lap time duration milliseconds]
    pit_stops = CSV.parse(File.read(data_loc + 'pit_stops.csv'),
                          headers: true, return_headers: false).map(&:fields)

    PitStop.import pit_stops_cols, pit_stops, validate: false

    # import qualifyings
    qualifyings_cols = %i[id race_id driver_id constructor_id number position q1 q2 q3]
    qualifyings = CSV.parse(File.read(data_loc + 'qualifying.csv'),
                            headers: true, return_headers: false).map(&:fields)

    Qualifying.import qualifyings_cols, qualifyings, validate: false

    # import results
    results_cols = %i[id race_id driver_id constructor_id number grid position position_text
                      position_order points laps time milliseconds fastest_lap rank
                      fastest_lap_time fastest_lap_speed status_id]
    results = CSV.parse(File.read(data_loc + 'results.csv'),
                        headers: true, return_headers: false).map(&:fields)

    Result.import results_cols, results, validate: false

    # import statuses
    statuses_cols = %i[id status]
    statuses = CSV.parse(File.read(data_loc + 'status.csv'),
                         headers: true, return_headers: false).map(&:fields)

    Status.import statuses_cols, statuses, validate: false

    puts 'Import completed!'
  end
end
