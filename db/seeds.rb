# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

free_role = Role.create(name: 'Free User')
micro_role = Role.create(name: 'Micro User')
standard_role = Role.create(name: 'Standard User')
pro_role = Role.create(name: 'Pro User')