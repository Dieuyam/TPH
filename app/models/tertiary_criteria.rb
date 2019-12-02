class TertiaryCriteria < ApplicationRecord
  has_many :join_table_tertiaries, dependent: :destroy
  has_many :accomodations, through: :join_table_tertiaries
end
