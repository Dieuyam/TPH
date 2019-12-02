class CreateJoinTableTertiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_tertiaries do |t|
      t.references :accomodation, foreign_key: true, index: true
      t.references :tertiary_criteria, foreign_key: true, index: true

      t.timestamps
    end
  end
end
