class AddCountryToAccomodation < ActiveRecord::Migration[5.2]
  def change
    add_reference :accomodations, :country, foreign_key: true
  end
end
