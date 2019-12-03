class Company < ApplicationRecord
  has_many :users
  validates :address, presence: true
  validates :siret, presence: true
  validates :name, presence: true
end
