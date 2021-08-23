class AddPlantsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.column :name, :string
      t.column :category, :string
      t.column :health, :integer
      t.column :user_id, :integer
    end
  end
end
