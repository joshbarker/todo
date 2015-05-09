
  require "faker"

  # Create Users
  10.times do
    user = User.new(
      name:     Faker::Name.name,
      email:    Faker::Internet.email,
      password: Faker::Lorem.characters(10)
    )
    user.skip_confirmation!
    user.save!
  end
  users = User.all

  # create the item
  20.times do 
    Item.create!(
      name: Faker::Lorem.sentence,
      user_id: Faker::Lorem.characters(10)
    )
  end
  items = Item.all

  # Report and finish
  puts "Seed finished"
  puts "#{User.count} users were created"
  puts "#{Item.count} items were created"
