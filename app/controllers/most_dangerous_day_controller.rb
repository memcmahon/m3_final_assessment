class MostDangerousDayController < ApplicationController
  def index
    @start_date = DateTime.strptime(params[:start_date], "%Y-%m-%d").strftime("%B %-d, %Y")
    @end_date = DateTime.strptime(params[:end_date], "%Y-%m-%d").strftime("%B %-d, %Y")
    @search_result = DangerDaySearchService.date_range_search(params[:start_date], params[:end_date])
  end
end
