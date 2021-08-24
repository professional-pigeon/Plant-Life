class AddTimestampsToPlants < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :plants, null: true
  end
end
