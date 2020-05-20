# frozen_string_literal: true

class ConstructorResult < ApplicationRecord
  belongs_to :constructor
  belongs_to :race
end
