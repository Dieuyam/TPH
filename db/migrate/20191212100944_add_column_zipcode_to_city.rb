class AddColumnZipcodeToCity < ActiveRecord::Migration[5.2]
  def change
  	add_column :cities, :zipcode, :string
  	remove_column :accomodations, :zipcode
  end
end
