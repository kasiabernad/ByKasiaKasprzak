Color.create(name:"biały", hex:"FFFFFF")
Color.create(name:"czerwony", hex:"D82B25")
Color.create(name:"niebieski", hex:"073CA5")
Color.create(name:"zielony", hex:"669900")

OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

Admin.create! email: "admin@admin.pl", password: "123123123", password_confirmation: "123123123"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
