class CreateRoadTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :road_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
