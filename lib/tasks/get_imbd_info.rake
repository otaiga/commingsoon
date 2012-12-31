namespace :imdb do
  task :retrieve => :environment do
    ImdbWorker.new.perform
  end
end