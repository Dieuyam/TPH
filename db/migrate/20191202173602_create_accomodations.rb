class CreateAccomodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accomodations do |t|
      t.string :road_number
      t.string :road_name
      t.string :zipcode
      t.float :living_space
      t.float :price
      t.integer :floor
      t.integer :floors_inside
      t.integer :rooms
      t.string :orientation
      t.string :ges

      t.timestamps
    end
  end
end
