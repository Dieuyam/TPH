class Accomodation < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :join_table_secondaries, dependent: :destroy
  has_many :secondary_criteria, through: :join_table_secondaries
  has_many :join_table_tertiaries, dependent: :destroy
  has_many :tertiary_criteria, through: :join_table_tertiaries
  belongs_to :road_type, optional: true
  belongs_to :heating, optional: true
  belongs_to :type_of_property, optional: true
  belongs_to :operation_type, optional: true
  belongs_to :city, optional: true
  belongs_to :country, optional: true
  validates :living_space, presence: true
  validates :rooms, presence: true
  validates :price, presence: true
  has_many_attached :photo
  belongs_to :owner, class_name: "User", optional: true

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [:title, :description],
    associated_against: {secondary_criteria: :name, tertiary_criteria: :name, city: :name},
    using: {
      tsearch: {any_word: true}
    }
end
