class AddTitletoAccomodation < ActiveRecord::Migration[5.2]
  def change
    add_column :accomodations, :title, :text
  end
end
