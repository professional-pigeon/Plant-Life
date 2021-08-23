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


# I need a range

# current epoch time stamp is 1629750559  (Time.now.to_i)

# 7 days from now is 1630380585

# range is 1630306800 to 1630393199

# add this to plants class

# a day is 86400