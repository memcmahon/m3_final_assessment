class AsteroidSearchService
  def self.find(favorite)
    response = conn(favorite).get do |req|
      req.params["api_key"] = ENV["NASA_API_KEY"]
    end

    raw_data = parse(response)

    FavAsteroid.find(favorite, raw_data)
  end

  def self.conn(favorite)
    Faraday.new("https://api.nasa.gov/neo/rest/v1/neo/#{favorite.neo_reference_id}")
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
