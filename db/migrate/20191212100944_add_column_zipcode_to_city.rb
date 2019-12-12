class AddColumnZipcodeToCity < ActiveRecord::Migration[5.2]
  def change
  	add_column :cities, :zipcode, :integer
  	remove_column :accomodations, :zipcode
  end
end
