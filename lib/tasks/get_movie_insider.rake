namespace :movieinsider do
  task :retrieve => :environment do
    puts "running movie db refresh job"
    MovieReminderWorker.new.perform
  end
end