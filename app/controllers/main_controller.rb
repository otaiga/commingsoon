class MainController < ApplicationController

  def index
    
  end

  def results
    month = params[:date][:month]
    year = params[:date][:year]
    selection = Date.parse("01-#{month}-#{year}")
    @response = MovieData.where(release_date: selection.beginning_of_month..selection.end_of_month)
    ## need to break this down further based on the release date (multiple entries)
  end

end
