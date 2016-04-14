# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = Dane.create!(username: "testuser", password: "password", email: "you@you.you",
first_name: "Dane", last_name: "Carmichael", bio: "My cool bio")
10.times do
  Vivek.create!(body: Faker::Hipster.sentence(4, true, 7), dane_id: user.id)
end
