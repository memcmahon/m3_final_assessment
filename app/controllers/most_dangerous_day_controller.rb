class MostDangerousDayController < ApplicationController
  def index
    @start_date = DateTime.strptime(params[:start_date], "%Y-%m-%d").strftime("%B %-d, %Y")
    @end_date = DateTime.strptime(params[:end_date], "%Y-%m-%d").strftime("%B %-d, %Y")
    @most_dangerous_day = DangerDaySearchService.most_dangerous_day(params[:start_date], params[:end_date])
    @dangeroids = @most_dangerous_day.dangeroids
  end
end
