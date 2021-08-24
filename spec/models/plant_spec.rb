require 'rails_helper'


describe Plant do

  it { should belong_to(:user) }
  # it { should validate_presence_of(:photo) }
  it { should have_one_attached(:photo) }


  it 'will add timer when category is tree or fruit' do
    test_user1 = User.create!({:email => "hello@hello.com", :username => "hello", :password => "hellohello", :password_confirmation => "hellohello"})
    tree_plant = Plant.create!({:name => 'Apple', :category => "Tree", :user_id => test_user1.id})
    fruit_plant = Plant.create!({:name => 'Grape', :category => "Fruit", :user_id => test_user1.id})
    time1 = Time.now.to_i + (86400 * 3)
    expect(tree_plant.wait_time).to(eq(Time.strptime(time1.to_s, '%s')))
    expect(fruit_plant.wait_time).to(eq(Time.strptime(time1.to_s, '%s')))
  end

  it 'will add timer when category is vegetable or herb' do
    test_user2 = User.create!({:email => "bye@bye.com", :username => "bye", :password => "byebye", :password_confirmation => "byebye"})
    vegetable_plant = Plant.create!({:name => 'Avocado', :category => "Vegetable", :user_id => test_user2.id})
    herb_plant = Plant.create!({:name => 'Rosemary', :category => "Herb", :user_id => test_user2.id})
    time2 = Time.now.to_i + (86400 * 4)
    expect(vegetable_plant.wait_time).to(eq(Time.strptime(time2.to_s, '%s')))
    expect(herb_plant.wait_time).to(eq(Time.strptime(time2.to_s, '%s')))
  end

  it 'will add timer when category is anything else' do
    test_user3 = User.create!({:email => "hola@hola.com", :username => "hola", :password => "holahola", :password_confirmation => "holahola"})
    other_plant = Plant.create!({:name => 'Senzu bean', :category => "Bean", :user_id => test_user3.id})
    time3 = Time.now.to_i + (86400 * 5)
    expect(other_plant.wait_time).to(eq(Time.strptime(time3.to_s, '%s')))
  end
end