# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

   Role.create(name: "admin")
   Role.create(name: "host")
   Role.create(name: "guest")

   User.create(first_name: "sharan", last_name: "chavadi", username: "sharan", mobile: "2345678765", role_id: 1, email: 'admin@gmail.com', password: "sharan123")
   User.create(first_name: "john", last_name: "snow", username: "john", mobile: "3456234565", role_id: 3, email: 'john@gmail.com', password: "sharan123")


# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
