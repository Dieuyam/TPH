class Accomodation < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :join_table_secondaries, dependent: :destroy
  has_many :secondary_criteria, through: :join_table_secondaries
  has_many :join_table_tertiaries, dependent: :destroy
  has_many :tertiary_criteria, through: :join_table_tertiaries
  belongs_to :road_type
  validates_associated :road_type
  belongs_to :heating
  validates_associated :heating
  belongs_to :type_of_property
  validates_associated :type_of_property
  belongs_to :operation_type
  validates_associated :operation_type
  belongs_to :city
  validates_associated :city
  belongs_to :country
  validates_associated :country
  validates :living_space, presence: true
  validates :rooms, presence: true
  validates :price,
    presence: true,
    numericality: { greater_than: 0 }
  has_many_attached :photo
  belongs_to :owner, class_name: "User", optional: true

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [:title, :description],
    associated_against: {secondary_criteria: :name, tertiary_criteria: :name, city: :name},
    using: {
      tsearch: {any_word: true}
    }

  def validation_on_zero

  end

    def smart_description
      if description.size > 100
        return description[0...100] + "..."
    else 
      return description
  end
end
end
