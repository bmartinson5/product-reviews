# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.destroy_all

50.times do
  User.create!(email: Faker::Internet.unique.safe_email(name: Faker::Name.name),
    password: Faker::Internet.password(min_length: 6)
  )
end
50.times do
  Product.create!(name: Faker::Food.ingredient,
    cost: Faker::Commerce.price(range: 0..20.00),
    country_of_origin: Faker::Address.country)
end
250.times do
  product_id = Product.all.sample.id
  user_id = User.all.sample.id
  Review.create!(product_id: product_id,
    user_id: user_id,
    author: Faker::Name.name,
    content_body: Faker::Lorem.sentence(word_count: 25, supplemental: false, random_words_to_add: 0),
    rating: Faker::Number.between(from: 1, to: 5))
end
