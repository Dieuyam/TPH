class AddDescriptionToAccomodations < ActiveRecord::Migration[5.2]
  def change
    add_column :accomodations, :description, :text
  end
end
