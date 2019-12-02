# uncomment if you're in development env
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
set :environment, "development"
set :output, error: "log/cron_error_log.log", standard: "log/cron_log.log"

every 1.day, at: "12pm" do
  rake "exchange_rate:update_exchange_rate"
  rake "order:shipped"
  rake "order:completed"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# Learn more: http://github.com/javan/whenever
