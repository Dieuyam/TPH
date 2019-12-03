class User < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :offer, optional: true
  has_many :favorites, dependent: :destroy
  has_many :accomodations, through: :favorites

  validates :phone, presence: true, format: { with: /\A^((\+)33|0)[1-9](\d{2}){4}$*\z/i, message:  "Le format du numéro de téléphone est incorrect. Veuillez le vérifier." }
end
