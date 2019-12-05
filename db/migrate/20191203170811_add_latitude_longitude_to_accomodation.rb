class AddLatitudeLongitudeToAccomodation < ActiveRecord::Migration[5.2]
  def change
   add_column :accomodations, :longitude, :float
   add_column :accomodations, :latitude, :float
  end

end

