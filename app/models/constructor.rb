# frozen_string_literal: true

class Constructor < ApplicationRecord
  has_many :qualifyings
  has_many :results
  has_many :standings, class_name: 'ConstructorStanding'
end
