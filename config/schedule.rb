# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, "log/cron_jobs.log"
job_type :local_command_with_no_output, "cd :path && :task" # no output so it won't mess up the redirection we have

#
# Example:
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every 4.days do
  # runner "APNClient.apple_feedback"
end

# the database is updated once a month, so we will grab it 2 times a month, just to be sure
every 2.week do
  local_command_with_no_output "curl -s http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz | tar -xOz  --wildcards '*.mmdb' > geo/GeoLite2-Country.mmdb"
end
