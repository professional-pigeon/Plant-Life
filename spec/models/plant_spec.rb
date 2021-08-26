require 'rails_helper'


describe Plant do
  it { should belong_to(:user) }
  # it { should validate_presence_of(:photo) }
  it { should have_one_attached(:photo) }
  it { should validate_presence_of(:name) }

  before(:all) do
    @test_user1 = User.all.first
    @tree_plant = Plant.create!({:name => 'Apple', :category => "Tree", :user_id => @test_user1.id, :health => "Good"})
    @fruit_plant = Plant.create!({:name => 'Grape', :category => "Fruit", :user_id => @test_user1.id, :health => "Excellent"})
    @vegetable_plant = Plant.create!({:name => 'Avocado', :category => "Vegetable", :user_id => @test_user1.id, :health => "Okay"})
    @herb_plant = Plant.create!({:name => 'Rosemary', :category => "Herb", :user_id => @test_user1.id, :health => "Bad"})
    @other_plant = Plant.create!({:name => 'Senzu bean', :category => "Bean", :user_id => @test_user1.id, :health => "Dismal"})
  end

  it 'will add timer when category is tree or fruit' do
    time1 = Time.now.to_i + (86400 * 3)
    expect(@tree_plant.wait_time).to(eq(Time.strptime(time1.to_s, '%s')))
    expect(@fruit_plant.wait_time).to(eq(Time.strptime(time1.to_s, '%s')))
  end

  it 'will add timer when category is vegetable or herb' do
    time2 = Time.now.to_i + (86400 * 4)
    expect(@vegetable_plant.wait_time).to(eq(Time.strptime(time2.to_s, '%s')))
    expect(@herb_plant.wait_time).to(eq(Time.strptime(time2.to_s, '%s')))
  end

  it 'will add timer when category is anything else' do
    time3 = Time.now.to_i + (86400 * 5)
    expect(@other_plant.wait_time).to(eq(Time.strptime(time3.to_s, '%s')))
  end

  it 'Change the health value to a number value' do
    expect(@other_plant.health_to_num).to(eq(1))
    expect(@vegetable_plant.health_to_num).to(eq(3))
    expect(@herb_plant.health_to_num).to(eq(2))
    expect(@tree_plant.health_to_num).to(eq(4))
    expect(@fruit_plant.health_to_num).to(eq(5))
  end
end