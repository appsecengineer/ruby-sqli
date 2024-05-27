# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#creats admin users and their ToDos
Fabricate.times(3, :user)

#creates ToDos
User.all.each do |user|
  unless user.to_dos.exists?
    Fabricate.times(3, :to_do, user: user)
    puts "Created 3 ToDos for #{user.email}"
  end
end
