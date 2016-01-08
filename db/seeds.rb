# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


zone = Zone.create([{engineer: 'yuvraj',contact: '8970931948',comments: 'NA'},{engineer: 'suhas',contact: '1234567890',comments: 'NA'},{engineer: 'shashank',contact: '9090909090',comments: 'NA'},{engineer: 'tejus',contact: '1212121212',comments: 'NA'}])

plan = Plan.create([{name: 'plan50',price: '300',plan_details: 'All English and kannada channels'},{name: 'plan100',price: '500',plan_details: 'Sports channels'}])
user = User.create(email: 'yuvraj.167@gmail.com',password: '12345678')
employee = Employee.create([{name: 'yuvi',mobile_no: '8970931948',zone_id: 1},{name: 'shashu',mobile_no: '1234567890',zone_id: 4}])