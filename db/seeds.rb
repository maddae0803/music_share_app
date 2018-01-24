# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

options = ["Songwriter/Artist", "Listener"]

User.create!(name: "Example User", email: "example@oberlin.edu", password: "foobar", password_confirmation: "foobar", user_type: "Songwriter/Artist",
	activated: true, activated_at: Time.zone.now)

40.times do |n|
	name = Faker::Name.name
	email = "example-#{n + 1}@oberlin.edu"
	password = "password"
	User.create!(name: name, email: email, password: password, password_confirmation: password, user_type: options[rand(2)],
		activated: true, activated_at: Time.zone.now)
end
