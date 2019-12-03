class Offer < ApplicationRecord
  has_many :users
  validates :description, presence: true
  validates :name, presence: true
  validates :end_date, presence: true
  validates :price, presence: true
end
