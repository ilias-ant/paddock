# frozen_string_literal: true

class Driver < ApplicationRecord
  has_many :lap_times
  has_many :pit_stops
  has_many :qualifyings
  has_many :results
  has_many :standings, class_name: 'DriverStanding'
end
