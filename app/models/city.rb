class City < ApplicationRecord
  has_many :accomodations
  validates :name, presence: true
end
