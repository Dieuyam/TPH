class AddCityToAccomodation < ActiveRecord::Migration[5.2]
  def change
    add_reference :accomodations, :cities, foreign_key: true
  end
end
