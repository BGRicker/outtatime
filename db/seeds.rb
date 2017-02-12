# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create!(first_name: "Guy", last_name: "Fieri", email: "guy@fieri.com", password: "asdasd", password_confirmation: "asdasd")
puts "1 user created, email: #{@user.email}"

admin = AdminUser.create(email: "flavorheck@bees.gov", password: "drowninginhoney", password_confirmation: "drowninginhoney", first_name: "Brimp", last_name: "Psimfin")
puts "1 admin user created, email: #{admin.email}, password: drowninginhoney"

10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "10 posts have been created "
