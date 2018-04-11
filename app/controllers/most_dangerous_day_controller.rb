class MostDangerousDayController < ApplicationController
  def index
    # refactor dates to presenter
    @start_date = DateTime.strptime(params[:start_date], "%Y-%m-%d").strftime("%B %-d, %Y")
    @end_date = DateTime.strptime(params[:end_date], "%Y-%m-%d").strftime("%B %-d, %Y")
    @most_dangerous_day = DangerDaySearchService.most_dangerous_day(params[:start_date], params[:end_date])
    @dangeroids = DaySearchResults.dangeroids
  end
end
