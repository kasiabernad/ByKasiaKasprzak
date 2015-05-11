Color.create(name:"biały", hex:"FFFFFF")
Color.create(name:"czerwony", hex:"D82B25")
Color.create(name:"niebieski", hex:"073CA5")
Color.create(name:"zielony", hex:"669900")

OrderStatus.create! id: 1, name: "Created"
OrderStatus.create! id: 2, name: "Waiting for payment"
OrderStatus.create! id: 3, name: "Payment failed"
OrderStatus.create! id: 4, name: "Payment pennding"
OrderStatus.create! id: 5, name: "Payment commit"
OrderStatus.create! id: 6, name: "Waiting for send"
OrderStatus.create! id: 7, name: "Send"
OrderStatus.create! id: 8, name: "Delivered"

Admin.create! email: "admin@admin.pl", password: "123123123", password_confirmation: "123123123"
User.create! email: "user@user.pl", password: "123123123", password_confirmation: "123123123"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
