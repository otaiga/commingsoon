namespace :mail do
  task :reminders => :environment do
    tomorrows_releases = Reminder.tomorrows_releases
    Movie::Reminders.process_reminders(tomorrows_releases) unless tomorrows_releases.empty?
  end
end