# frozen_string_literal: true

require 'csv'

namespace :db do
  desc 'import F1 historic data into the database from CSVs'
  task import_ergast_data: :environment do
    puts "Importing Ergast historic data into the #{Rails.env} database. This may take a while..."

    data_loc = 'public/ergast_data/'

    seasons = CSV.parse(File.read(data_loc + 'seasons.csv'), headers: true)

    seasons.each do |season|
      Season.create!(year: season['year'], url: season['url'])
    end

    circuits = CSV.parse(File.read(data_loc + 'circuits.csv'), headers: true)

    circuits.each do |circuit|
      Circuit.create!(id: circuit['circuitId'], nickname: circuit['circuitRef'],
                      name: circuit['name'], location: circuit['location'],
                      country: circuit['country'], lat: circuit['lat'],
                      lng: circuit['lng'], alt: circuit['alt'], url: circuit['url'])
    end

    constructors = CSV.parse(File.read(data_loc + 'constructors.csv'), headers: true)

    constructors.each do |constructor|
      Constructor.create!(id: constructor['constructorId'], nickname: constructor['constructorRef'],
                          name: constructor['name'], nationality: constructor['nationality'],
                          url: constructor['url'])
    end

    drivers = CSV.parse(File.read(data_loc + 'drivers.csv'), headers: true)

    drivers.each do |driver|
      Driver.create!(id: driver['driverId'], nickname: driver['driverRef'], number: driver['number'],
                     code: driver['code'], forename: driver['forename'], surname: driver['surname'],
                     dob: driver['dob'], nationality: driver['nationality'], url: driver['url'])
    end

    constructor_results = CSV.parse(File.read(data_loc + 'constructor_results.csv'), headers: true)

    constructor_results.each do |result|
      ConstructorResult.create!(id: result['constructorResultsId'], race_id: result['raceId'],
                                constructor_id: result['constructorId'], points: result['points'],
                                status: result['status'])
    end

    constructor_standings = CSV.parse(File.read(data_loc + 'constructor_standings.csv'), headers: true)

    constructor_standings.each do |standing|
      ConstructorStanding.create!(id: standing['constructorStandingsId'], race_id: standing['raceId'],
                                  constructor_id: standing['constructorId'], points: standing['points'],
                                  position: standing['position'], position_text: standing['positionText'],
                                  wins: standing['wins'])
    end

    driver_standings = CSV.parse(File.read(data_loc + 'driver_standings.csv'), headers: true)

    driver_standings.each do |standing|
      DriverStanding.create!(id: standing['constructorStandingsId'], race_id: standing['raceId'],
                             driver_id: standing['driverId'], points: standing['points'],
                             position: standing['position'], position_text: standing['positionText'],
                             wins: standing['wins'])
    end

    races = CSV.parse(File.read(data_loc + 'races.csv'), headers: true)

    races.each do |race|
      Race.create!(id: race['raceId'], year: race['year'], round: race['round'],
                   circuit_id: race['circuitId'], name: race['name'], date: race['date'],
                   time: race['time'], url: race['url'])
    end

    lap_times = CSV.parse(File.read(data_loc + 'lap_times.csv'), headers: true)

    lap_times.each do |lt|
      LapTime.create!(race_id: lt['raceId'], driver_id: lt['driverId'], lap: lt['lap'],
                      position: lt['position'], time: lt['time'], milliseconds: lt['milliseconds'])
    end

    pit_stops = CSV.parse(File.read(data_loc + 'pit_stops.csv'), headers: true)

    pit_stops.each do |ps|
      PitStop.create!(race_id: ps['raceId'], driver_id: ps['driverId'], stop: ps['stop'],
                      lap: ps['lap'], time: ps['time'], duration: ps['durations'],
                      milliseconds: ps['milliseconds'])
    end

    qualifyings = CSV.parse(File.read(data_loc + 'qualifying.csv'), headers: true)

    qualifyings.each do |quali|
      Qualifying.create!(id: quali['qualifyId'], race_id: quali['raceId'], driver_id: quali['driverId'], 
                         constructor_id: quali['constructorId'], number: quali['number'],
                         position: quali['position'], q1: quali['q1'], q2: quali['q2'],
                         q3: quali['q3'])
    end

    results = CSV.parse(File.read(data_loc + 'results.csv'), headers: true)

    results.each do |res|
      Result.create!(id: res['resultId'], race_id: res['raceId'], driver_id: res['driverId'],
                     constructor_id: res['constructorId'], number: res['number'], grid: res['grid'],
                     position: res['position'], position_text: res['positionText'],
                     position_order: res['positionOrder'], points: res['points'], laps: res['laps'], 
                     time: res['time'], milliseconds: res['milliseconds'], fastest_lap: res['fastestLap'], 
                     rank: res['rank'], fastest_lap_time: res['fastestLapTime'],
                     fastest_lap_speed: res['fastestLapSpeed'], status_id: res['statusId'])
    end

    statuses = CSV.parse(File.read(data_loc + 'status.csv'), headers: true)

    statuses.each do |stat|
      Status.create!(id: stat['statusId'], status: stat['status'])
    end

    puts 'Import completed!'
  end
end
