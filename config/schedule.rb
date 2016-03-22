require 'active_support/time'

ENV['RAILS_ENV'] = "development"
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
 RAILS_ROOT = File.dirname(__FILE__) + '/..'
# Example:
#
 set :environment, "development"
 set :output, "#{path}/log/cron.log"
#
# every 2.hours destroy
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 1.month do
# 	# rake "complaint:simple" 
# 	# command "echo 'yuvraj_srinivas' "
# 	runner 'Complaint.where("updated_at <= ?", 1.month.ago).destroy_all'
# end	

every 1.minute do
	#runner 'Complaint.where("updated_at <= ?", Time.now).destroy_all'
	runner 'Customer.all.each {|i| Payment.create(payment_date: (Date.today - 30),status: "unpaid",customer_id: i.id,zone_id: i.zone_id)}'
end

# Learn more: http://github.com/javan/whenever
