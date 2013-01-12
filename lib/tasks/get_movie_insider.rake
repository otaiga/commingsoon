namespace :movieinsider do
  task :retrieve => :environment do
    MovieReminderWorker.new.perform
  end
end