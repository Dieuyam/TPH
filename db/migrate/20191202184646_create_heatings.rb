class CreateHeatings < ActiveRecord::Migration[5.2]
  def change
    create_table :heatings do |t|
      t.string :name

      t.timestamps
    end
  end
end
