class AddOperationTypeToAccomodation < ActiveRecord::Migration[5.2]
  def change
    add_reference :accomodations, :operation_types, foreign_key: true
  end
end
