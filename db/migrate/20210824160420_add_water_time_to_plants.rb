class AddWaterTimeToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column(:plants, :water_time, :datetime)
  end
end
