class AddOwnerToAccomodation < ActiveRecord::Migration[5.2]
  def change
    add_reference :accomodations, :owner, foreign_key: { to_table: :users }
  end
end
