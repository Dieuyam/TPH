class CreateJoinTableSecondaries < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_secondaries do |t|
      t.references :accomodation, foreign_key: true, index: true
      t.references :secondary_criteria, foreign_key: true, index: true
      t.float :score

      t.timestamps
    end
  end
end
