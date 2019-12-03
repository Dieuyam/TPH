class CreateTertiaryCriteria < ActiveRecord::Migration[5.2]
  def change
    create_table :tertiary_criteria do |t|
      t.string :name

      t.timestamps
    end
  end
end
