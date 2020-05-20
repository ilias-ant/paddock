# frozen_string_literal: true

class ConstructorStanding < ApplicationRecord
  belongs_to :constructor
  belongs_to :race
end
