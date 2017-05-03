# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r1 = Role.create({name: "Regular", description: "Can read items"})
r2 = Role.create({name: "Seller", description: "Can read and create items. Can update and destroy own items"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "mohan", email: "mohan@example.com", password: "mohan@example", password_confirmation: "mohan@example", role_id: r1.id})
u2 = User.create({name: "karthik", email: "karthik@example.com", password: "karthik@example", password_confirmation: "karthik@example", role_id: r2.id})
u3 = User.create({name: "ishaq", email: "ishaq@example.com", password: "ishaq@example", password_confirmation: "ishaq@example", role_id: r2.id})
u4 = User.create({name: "king", email: "king@example.com", password: "king@example", password_confirmation: "king@example", role_id: r3.id})

i1 = Item.create({name: "Rayban Sunglasses", description: "Stylish shades", price: 99.99, user_id: u2.id})
i2 = Item.create({name: "Gucci watch", description: "Expensive timepiece", price: 199.99, user_id: u2.id})
i3 = Item.create({name: "Henri Lloyd Pullover", description: "Classy knitwear", price: 299.99, user_id: u3.id})
i4 = Item.create({name: "Porsche socks", description: "Cosy footwear", price: 399.99, user_id: u3.id})