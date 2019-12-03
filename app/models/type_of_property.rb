class TypeOfProperty < ApplicationRecord
  has_many :accomodations

  validates :name, presence: true
end
