# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Plant.destroy_all
Message.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!(User.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Plant.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Message.table_name)

5.times do |index| 
  @user = User.new({ username: Faker::Name.first_name, email: Faker::Internet.email, password: 'User2002!', password_confirmation: 'User2002!'})
  @user.skip_confirmation!
  @user.save
end

100.times do |index|
  categories = ['Tree', 'Houseplant',  'Vegetable', 'Fruit', 'Herb']
  health_array = ["Dismal", "Bad", "Okay", "Good", "Excellent"]
  Plant.create!(name: Faker::Food.vegetables, category: categories.sample, health: health_array.sample, user_id: Faker::Number.within(range: 1..5), water_time: Time.now, health_next_update: Time.now.to_i )
end

@sample_user = User.new({ username: "Chuck Testa", email: "Test@test.com", password: 'User2002!', password_confirmation: 'User2002!'})
@sample_user.skip_confirmation!
@sample_user.save

8.times do |index|
  categories = ['Tree', 'Houseplant',  'Vegetable', 'Fruit', 'Herb']
  health_array = ["Dismal", "Bad", "Okay", "Good", "Excellent"]
  Plant.create!(name: Faker::Food.vegetables, category: categories.sample, health: health_array.sample, user_id: @sample_user.id, water_time: Time.now, health_next_update: Time.now.to_i )
end

100.times do
  Message.create!(content: Faker::Quote.famous_last_words, sender_id: Faker::Number.within(range: 1..6), recipient_id: Faker::Number.within(range: 1..6))
end

AdminUser.create!(email: 'admin@admin.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

p "Created #{User.count} users and #{Plant.count} plants."