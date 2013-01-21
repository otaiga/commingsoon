require "spec_helper"

describe Moviereminder do

  it "should send reminder" do
    movie_name = "This Movie"
    recipient = "test.mail@testing.com"
    Moviereminder.send_reminder(movie_name, recipient)
    ActionMailer::Base.deliveries.last.to.should == [recipient]
    ActionMailer::Base.deliveries.last.subject.should == "Your Movie Reminder for Tomorrow's Release"
    ActionMailer::Base.deliveries.last.body.should == "Hi #{recipient},\n<p>You recently asked for a reminder when : <b>#{movie_name}</b> is released. Well : <b>#{movie_name}</b>is expected to be released tomorrow. We hope you enjoy the movie.</p>"
  end
end
