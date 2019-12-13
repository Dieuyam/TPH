class City < ApplicationRecord
  has_many :accomodations, dependent: :destroy
  validates :name, presence: true

  def city_name_with_zipcode
    "#{self.name} - #{self.zipcode}"
  end
end
