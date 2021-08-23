class ChangeHealthToString < ActiveRecord::Migration[5.2]
  def change
    change_column :plants, :health, :string
  end
end
