class User < ApplicationRecord
  belongs_to :company
  belongs_to :offer
  has_many :favorites, dependent: :destroy
  has_many :accomodations, through: :favorites
end
