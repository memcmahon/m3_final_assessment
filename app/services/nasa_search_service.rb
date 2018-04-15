class NasaSearchService
  def self.conn
    Faraday.new("https://api.nasa.gov")
  end

  def self.get_danger_day(start_date, end_date)
    response = conn.get do |req|
      req.url '/neo/rest/v1/feed'
      req.params["start_date"] = start_date
      req.params["end_date"] = end_date
      req.params["api_key"] = ENV["NASA_API_KEY"]
    end

    DaySearchResults.results(parse(response))
  end

  def self.get_asteroid(favorite)
    response = conn.get do |req|
      req.url "/neo/rest/v1/neo/#{favorite.neo_reference_id}"
      req.params["api_key"] = ENV["NASA_API_KEY"]
    end

    FavAsteroid.find(favorite, parse(response))
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
