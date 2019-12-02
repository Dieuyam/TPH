class Accomodation < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  belongs_to :type_of_property
  belongs_to :road_type
  belongs_to :city
  belongs_to :operation_type
end
