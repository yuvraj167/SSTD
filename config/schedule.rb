# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# RAILS_ROOT = File.dirname(__FILE__) + '/..'

# Example:
#
 set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
 every 1.minute do
	# rake 'lib/tasks/cleanup_complaint.rake'
	command "echo 'you can use raw cron sytax too'"
	Complaint.last.destroy
end

# Learn more: http://github.com/javan/whenever
