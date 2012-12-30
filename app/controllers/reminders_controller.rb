class RemindersController < ApplicationController
  before_filter :authenticate_user!

  def create
    # do something here 
    redirect_to root_path
  end

end
