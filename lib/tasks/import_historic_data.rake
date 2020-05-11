# frozen_string_literal: true

require 'csv'

namespace :db do
  desc 'import F1 historic data into the database via csv files'
  task seed_historical_data: :environment do
    data_loc = '/home/iantonopoulos/f1db_csv/'

    # TODO: insert IDs in the correct fashion, as to maintain schema integrity

    seasons = CSV.parse(File.read(data_loc + 'seasons.csv'), headers: true)
    seasons.each do |season|
      Season.create!(season.to_hash)
    end

    circuits = CSV.parse(File.read(data_loc + 'circuits.csv'), headers: true)
    circuits.each do |circuit|
      Circuit.create!(circuit.to_hash)
    end
  end
end
