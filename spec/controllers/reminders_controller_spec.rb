require 'spec_helper'

describe RemindersController do
  before(:each) do
    create_confirm_user
    sign_in given_user
  end

  it "should get index" do
    create_reminders(given_user, given_movie)
    get :index
    response.should be_success
    assigns(:reminders).should == given_user.reminders
  end

  it "should create reminder" do
    request.env["HTTP_REFERER"] = root_path
    post :create, title_id: given_movie.title_id
    response.should redirect_to root_path
    given_user.reminders.count.should == 1
  end

  it "should destroy reminder" do
    create_reminders(given_user, given_movie)
    delete :destroy, :id => given_reminder.id
    response.should redirect_to reminders_path
    given_user.reload
    given_user.reminders.count.should == 0
  end


end