# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def post_params
  {
    address: 'Champ de Mars, 5 Av. Anatole France, 75007 Paris',
    starting_date: Time.zone.today + 1.month,
    ending_date: Time.zone.today + 1.month
  }
end

if Rails.env.development?
  admin = User.create(email: 'admin@example.com', password: 'password')
  visitor = User.create(email: 'visitor@example.com', password: 'password')

  Post.create_with(post_params)
      .create!(title: 'Visitor\'s first post', body: 'This is the first post of the visitor', user: visitor)
  Post.create_with(post_params)
      .create!(title: 'Admin\'s first post', body: 'This is the first post of the admin', user: admin)
end
