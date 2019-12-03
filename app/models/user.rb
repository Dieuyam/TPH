class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company, optional: true
  belongs_to :offer, optional: true
  has_many :favorites, dependent: :destroy
  has_many :accomodations, through: :favorites

  #validates :phone, format: { with: /\A^((\+)33|0)[1-9](\d{2}){4}$*\z/i, message:  "Le format du numéro de téléphone est incorrect. Veuillez le vérifier." }
end
