# frozen_string_literal: true

class Qualifying < ApplicationRecord
  belongs_to :constructor
  belongs_to :driver
  belongs_to :race
end
