class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.text :description
      t.string :name
      t.datetime :end_date
      t.float :price

      t.timestamps
    end
  end
end
