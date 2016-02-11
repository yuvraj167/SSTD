# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#zone = Zone.create([{engineer: 'yuvraj',contact: '8970931948',comments: 'NA'},{engineer: 'suhas',contact: '1234567890',comments: 'NA'},{engineer: 'shashank',contact: '9090909090',comments: 'NA'},{engineer: 'tejus',contact: '1212121212',comments: 'NA'}])
plan = Plan.create([{name: 'Platinum',price: '1500',plan_details: 'All English,Kannada & Sports channels'},{name: 'Gold',price: '1000',plan_details: 'All English & Kannada channels'},{name: 'Silver',price: '500',plan_details: 'All Kannada channels'}])
employee = Employee.create([{name: 'yuvraj',mobile_no: '8970931948'},{name: 'shashank',mobile_no: '1234567890'},{name: 'suhas',mobile_no: '0987654321'},{name: 'Tejus',mobile_no: '1212121212'}])
zone = Zone.create([{name: 'zone_1',comments: 'NA',employee_id: 1},{name: 'zone_2',comments: 'NA',employee_id: 2},{name: 'zone_3',comments: 'NA',employee_id: 3},{name: 'zone_4',comments: 'NA',employee_id: 4}])
customer = Customer.create(first_name: 'yuvraj',last_name: 'srinivas',date_of_birth: Time.now,email_id: 'yuvraj.167@gmail.com',mobile_no: '8970931948',address: "NA",customer_friendly_id: 'YUVI167',setup_box_number: 'YUVI167',plan_id: 1,zone_id: 1)
#complaint = Complaint.create([{issue: 'No Video',status: 'assigned',customer_id: 1,employee_id: 1},{issue: 'No Audio',status: 'assigned',customer_id: 2,employee_id: 2}])