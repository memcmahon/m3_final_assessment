class DangerDaySearchService
  def self.date_range_search(start_date, end_date)
    response = conn.get do |req|
      req.params["start_date"] = start_date
      req.params["end_date"] = end_date
      req.params["api_key"] = ENV["NASA_API_KEY"]
    end

    DaySearchResults.new(parse(response))
  end

  def self.conn
    Faraday.new("https://api.nasa.gov/neo/rest/v1/feed")
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
