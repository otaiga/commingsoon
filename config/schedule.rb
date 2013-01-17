# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

env :PATH, ENV['PATH']
set :output, "/var/apps/comingsoon/shared/log/cron_log.log"

every 2.minutes do
  command "touch ~/testing_cron"
end

## Run reminder mail check every morning at 2:00am.
every 1.day, :at => '2am' do
  rake "mail:reminders"
end

## Run db refresh every 2 weeks at 12:00am.
every 2.weeks, :at => '12am' do
  rake "movieinsider:retrieve"
end