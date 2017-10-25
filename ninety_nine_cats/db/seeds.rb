# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# a = Cat.create({ name: 'Biscuit', color: 'brown', sex: 'M', description: 'Biscuit the Cat', birth_date: Date.new(2001,2,3) })
# b = Cat.create({ name: 'Daisy', color: 'white', sex: 'F', description: 'Daisy the Cat', birth_date: Date.new(2005,4,6)})

r1 = CatRentalRequest.create(cat_id: 1, start_date: Date.new(2017, 10, 25), end_date: Date.new(2017, 11, 1))
r2 = CatRentalRequest.create(cat_id: 2, start_date: Date.new(2017, 10, 25), end_date: Date.new(2017, 11, 1))
r3 = CatRentalRequest.create(cat_id: 3, start_date: Date.new(2017, 10, 25), end_date: Date.new(2017, 11, 1))
# r4 = CatRentalRequest.create(cat_id: 2, start_date: Date.new(2017, 10, 25), end_date: Date.new(2017, 11, 1))
