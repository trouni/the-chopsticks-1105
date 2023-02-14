puts 'Removing the restaurants...'
Restaurant.destroy_all

chefs = %W[Julien Kenta Gilary Mehdi Tan Jim Emmanuel Anik Miriam Grant Wanyu Chieri Mandil Taka Josh Ruka Emily Joe Emika Chieko Jackson Kris Yoshiko Anri Kevin Luca LuYee]
categories = %W[burgers ramen sushi desserts healthy kebabs pizza tacos sandwiches dumplings soup curry rice pasta steak vegan bakery juice salads seafood brunch wings cafe bbq deli pies buffet]

puts "Creating #{chefs.count} Restaurants..."
chefs.shuffle.each do |name|
  Restaurant.create!(
    name: "#{name}'s #{Faker::Restaurant.name}",
    address: Faker::Address.street_address,
    rating: rand(1..5),
    category: categories.delete_at(rand(0...categories.length))
  )
end
puts "...created #{Restaurant.count} restaurants"
