class SecondaryCriteria < ApplicationRecord
  has_many :join_table_secondaries, dependent: :destroy
  has_many :accomodations, through: :join_table_secondaries
  validates :name, presence: true
end
