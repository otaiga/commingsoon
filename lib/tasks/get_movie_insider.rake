namespace :movieinsider do
  task :retrieve => :environment do
    puts "#{Date.today} : running movie db refresh job"
    MovieReminderWorker.new.perform
  end
end