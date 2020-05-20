# frozen_string_literal: true

class LapTime < ApplicationRecord
  belongs_to :driver
  belongs_to :race
end
