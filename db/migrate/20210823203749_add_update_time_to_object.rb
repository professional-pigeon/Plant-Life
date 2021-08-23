class AddUpdateTimeToObject < ActiveRecord::Migration[5.2]
  def change
    add_column(:plants, :health_next_update, :integer)
  end
end