# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Admin", last_name: "cargo", role: User.roles[:admin], email: "admin@cargo.com", password: "123456")
User.create(first_name: "Customer", last_name: "cargo", role: User.roles[:customer], email: "customer@cargo.com", password: "123456")
