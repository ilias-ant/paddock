# frozen_string_literal: true

class DriverStanding < ApplicationRecord
  belongs_to :driver
  belongs_to :race
end
