require 'rails_helper'


describe Plant do
  
  before(:each) do
    test_user = User.create!({:email => "hello@hello.com", :username => "hello", :password => "bye", :password_confirmation => "bye"})
  end
  it { should belong_to(:user) }
  # it { should validate_presence_of(:photo) }
  it { should have_one_attached(:photo) }


  it 'will add timer when category is tree or fruit' do
    tree_plant = Plant.create!({:name => 'Apple', :category => "Tree"})
    time = Time.now.to_i + (86400 * 3)
    expect(tree_plant.wait_time).to(eq(Time.strptime(time.to_s, '%s')))
  end
end