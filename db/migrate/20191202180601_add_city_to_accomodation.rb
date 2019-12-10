class AddCityToAccomodation < ActiveRecord::Migration[5.2]
  def change
    add_reference :accomodations, :city, foreign_key: true
  end
end
