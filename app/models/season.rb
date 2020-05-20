# frozen_string_literal: true

class Season < ApplicationRecord
  self.primary_key = 'year'

  has_many :races, class_name: 'Race', foreign_key: 'year'

  validates :username, presence: true, uniqueness: true
end
