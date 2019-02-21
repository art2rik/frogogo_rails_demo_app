# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(phone: "+79991112233", name: "Petr", password: "123456", api_key: "123456")
User.create!(phone: "+79991112244", name: "Oleg", password: "123456", api_key: "123457")
User.create!(phone: "+79991112255", name: "Jesus", password: "666666", api_key: "666666")

Admin.create!(email: "admin@frogogo.ru", password: "123456")
Admin.create!(email: "admin2@frogogo.ru", password: "123456")