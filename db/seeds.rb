# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
admin = User.create(name: "Aaron", email: "admin@admin.com", role: "admin", password: "111111", password_confirmation: "111111")

Group.create(name: "Food", icon: "\u{1F354}", user_id: admin.id)
