# frozen_string_literal: true

class Race < ApplicationRecord
  belongs_to :circuit
  belongs_to :season, class_name: 'Season', foreign_key: 'year'
  has_many :constructor_standings
  has_many :driver_standings
  has_many :lap_times
  has_many :pit_stops
  has_many :qualifyings
  has_many :results
end
