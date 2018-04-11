class AsteroidSearchService
  def self.find(favorite)
    conn = Faraday.new("https://api.nasa.gov/neo/rest/v1/neo/#{favorite.neo_reference_id}")

    response = conn.get do |req|
      req.params["api_key"] = ENV["NASA_API_KEY"]
    end

    raw_data = JSON.parse(response.body, symbolize_names: true)

    FavAsteroid.new(favorite, raw_data)
  end
end
