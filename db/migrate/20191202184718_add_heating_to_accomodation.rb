class AddHeatingToAccomodation < ActiveRecord::Migration[5.2]
  def change
    add_reference :accomodations, :heating, foreign_key: true
  end
end
