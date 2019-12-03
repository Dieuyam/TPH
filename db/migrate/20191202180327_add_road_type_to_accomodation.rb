class AddRoadTypeToAccomodation < ActiveRecord::Migration[5.2]
  def change
    add_reference :accomodations, :road_types, foreign_key: true
  end
end
