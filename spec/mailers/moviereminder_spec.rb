require "spec_helper"

describe Moviereminder do

  it "should send reminder" do
    movie_name = "This Movie"
    recipient = "test.mail@testing.com"
    Moviereminder.send_reminder(movie_name, recipient)
    ActionMailer::Base.deliveries.last.to.should == ["test.mail@testing.com"]
    ActionMailer::Base.deliveries.last.subject.should == "Your Movie Reminder for Tomorrow's Release"
  end
end
