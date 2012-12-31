class MainController < ApplicationController

  def index
    
  end

  def results
    month = params[:date][:month]
    year = params[:date][:year]
    selection = Date.parse("01-#{month}-#{year}")
    @response = MovieData.get_dates(selection)
  end

end
