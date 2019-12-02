class CreateSecondaryCriteria < ActiveRecord::Migration[5.2]
  def change
    create_table :secondary_criteria do |t|
      t.string :name

      t.timestamps
    end
  end
end
