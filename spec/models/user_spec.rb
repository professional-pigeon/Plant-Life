require 'rails_helper'

describe User do
  it { should have_many(:plants) }
  
  before(:all) do
    @test_user1 = User.all.last
    @tree_plant = Plant.create!({:name => 'Apple', :category => "Tree", :user_id => @test_user1.id, :health => "Good"})
    @fruit_plant = Plant.create!({:name => 'Grape', :category => "Fruit", :user_id => @test_user1.id, :health => "Excellent"})
    @vegetable_plant = Plant.create!({:name => 'Avocado', :category => "Vegetable", :user_id => @test_user1.id, :health => "Okay"})
    @herb_plant = Plant.create!({:name => 'Rosemary', :category => "Herb", :user_id => @test_user1.id, :health => "Bad"})
    @other_plant = Plant.create!({:name => 'Senzu bean', :category => "Bean", :user_id => @test_user1.id, :health => "Dismal"})
  end

  it 'will tell you how many plants in each health category there are' do
    time1 = Time.now.to_i + (86400 * 3)
    expect(@tree_plant.wait_time).to(eq(Time.strptime(time1.to_s, '%s')))
    expect(@fruit_plant.wait_time).to(eq(Time.strptime(time1.to_s, '%s')))
  end
end
