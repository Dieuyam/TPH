class JoinTableSecondary < ApplicationRecord
  belongs_to :secondary_criteria
  belongs_to :accomodation
end
