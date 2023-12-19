# Learn more: http://github.com/javan/whenever

 env :PATH, ENV['PATH'] 
 set :output, "log/cron.log"
 
 every 1.day do
   runner "PlansSelectedSchedule.update_day_used"
 end

 # Execute the cron 
 # bundle exec whenever --update-crontab

 # List cron that is running
 # crontab -l

 # Clean file
 # bundle exec whenever --clear-crontab

 # Set the in
 # bundle exec whenever --update-crontab --set environment='development'
