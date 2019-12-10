class User < ApplicationRecord
  after_create :welcome_send, :welcome_offer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company, optional: true
  belongs_to :offer, optional: true
  has_many :favorites, dependent: :destroy
  has_many :accomodations, through: :favorites
  has_one_attached :profile_picture
  has_many :accomodations, foreign_key: 'owner_id', class_name: "Accomodation", dependent: :destroy

  #validates :phone, presence: true, format: { with: /\A^((\+)33|0)[1-9](\d{2}){4}$*\z/i, message:  "Le format du numéro de téléphone est incorrect. Veuillez le vérifier." }
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def welcome_offer
    self.update(:offer_id => 1)
  end


end
