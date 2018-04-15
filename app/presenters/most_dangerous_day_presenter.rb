class MostDangerousDayPresenter
  attr_reader :start_date, :end_date

  def initialize(start_date, end_date)
    @start_date = DateTime.strptime(start_date, "%Y-%m-%d").strftime("%B %-d, %Y")
    @end_date = DateTime.strptime(end_date, "%Y-%m-%d").strftime("%B %-d, %Y")
    @search_result = DaySearchResults.search(start_date, end_date)
  end

  def most_dangerous_day
    DateTime.strptime(@search_result.most_dangerous_day.to_s, "%Y-%m-%d").strftime("%B %-d, %Y")
  end

  def dangeroids
    @search_result.dangeroids
  end
end
