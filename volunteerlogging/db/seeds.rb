# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Volunteer.create( volunteer_id: 22, firstName: "Travon", lastName: "Royal", email: "RoyalTra31@gamil.com", phoneNum: "847-418-1402", volType: "Au Football")

Volunteer.create( volunteer_id: 2, firstName: "Xavier", lastName: "Ruiz", email: "lruiz10@gamil.com", phoneNum: "847-418-8989", volType: "Comsmo")

Hour.create( hour_id:2, hoursWorked: 3.8, weekWorked: "2017-11-21", volunteer_id:1)