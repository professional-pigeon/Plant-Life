class AddForeignKeyToPlants < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :plants, :users
  end
end
