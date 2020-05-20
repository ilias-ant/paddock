# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :constructor
  belongs_to :driver
  belongs_to :race
  belongs_to :status
end
