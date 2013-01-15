require 'spec_helper'

describe Reminder do

  describe "Valid parameters" do
    before(:each) do
      create_confirm_user
    end
    
    it "should save a reminder for user" do
      @reminder = given_user.reminders.new(movie_title_id: given_movie.title_id)
      @reminder.save.should == true
      given_user.reminders.count.should == 1
    end

    it "should destroy a reminder for user" do
      create_reminders(given_user, given_movie)
      given_reminder.destroy
      given_user.reminders.count.should == 0
    end

    it "should get the movie profile of a reminder" do
      create_reminders(given_user, given_movie)
      given_reminder.movie.should == given_movie
    end

    it "should get tomorrow's releases" do
      create_reminders(given_user, given_movie)
      given_movie.update_attributes(release_date: Date.tomorrow)
      Reminder.tomorrows_releases.should == [given_reminder]
    end

    it "should destroy the reminders for user if user is destroyed" do
      create_reminders(given_user, given_movie)
      given_user.reminders.count.should == 1
      given_user.destroy
      Reminder.count.should == 0
    end

  end
end
