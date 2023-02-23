puts 'Removing the restaurants...'
User.destroy_all
Restaurant.destroy_all

chefs = %W[Julien Kenta Gilary Mehdi Tan Jim Emmanuel Anik Miriam Grant Wanyu Chieri Mandil Taka Josh Ruka Emily Joe Emika Chieko Jackson Kris Yoshiko Anri Kevin Luca LuYee]
categories = %W[burgers ramen sushi desserts healthy kebabs pizza tacos sandwiches dumplings soup curry rice pasta steak vegan bakery juice salads seafood brunch wings cafe bbq deli pies buffet]

puts "Creating users..."
users = [
  {
    username: 'trouni',
    email: 'trouni@me.com',
  },
  {
    username: 'dmbf29',
    email: 'doug@me.com'
  }
]
users.each do |user_hash|
  user = User.new(user_hash)
  user.password = 123123
  user.save!
end

puts "Creating #{chefs.count} Restaurants..."
chefs.shuffle.each do |name|
  Restaurant.create!(
    name: "#{name}'s #{Faker::Restaurant.name}",
    description: Faker::Restaurant.description,
    address: Faker::Address.street_address,
    rating: rand(1..5),
    category: categories.delete_at(rand(0...categories.length)),
    chef_name: name,
    user: User.all.sample
  )
end
puts "...created #{Restaurant.count} restaurants"

puts "Creating reviews..."
Restaurant.all.each do |restaurant|
  rand(0..10).times do
    Review.create!(
      content: Faker::Restaurant.review,
      restaurant: restaurant
    )
  end
end
puts "...created #{Review.count} reviews"
