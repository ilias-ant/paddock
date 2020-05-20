# frozen_string_literal: true

class PitStop < ApplicationRecord
  belongs_to :driver
  belongs_to :race
end
