class AddTypeToAccomodation < ActiveRecord::Migration[5.2]
  def change
    add_reference :accomodations, :type_of_property, foreign_key: true
  end
end
