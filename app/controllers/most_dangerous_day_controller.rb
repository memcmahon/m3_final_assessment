class MostDangerousDayController < ApplicationController
  def index
    @start_date = DateTime.strptime(params[:start_date], "%Y-%m-%d").strftime("%B %-d, %Y")
    @end_date = DateTime.strptime(params[:end_date], "%Y-%m-%d").strftime("%B %-d, %Y")
    @search_result = DangerDaySearchService.most_dangerous_day(params[:start_date], params[:end_date])
    # binding.pry
    # @most_dangerous_day = DangerDaySearchService.most_dangerous_day(params[:start_date], params[:end_date])
    # @dangeroids = @most_dangerous_day.dangeroids
  end
end
