# frozen_string_literal: true

require 'csv'

namespace :db do
  desc 'import F1 historic data into the database via csv files'
  task import_ergast_data: :environment do
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
  end
end
