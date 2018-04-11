class DangerDaySearchService
  def self.most_dangerous_day(start_date, end_date)
    conn = Faraday.new("https://api.nasa.gov/neo/rest/v1/feed")

    response = conn.get do |req|
      req.params["start_date"] = start_date
      req.params["end_date"] = end_date
      req.params["api_key"] = ENV["NASA_API_KEY"]
    end

    raw_data = JSON.parse(response.body, symbolize_names: true)

    DaySearchResults.most_dangerous_day(raw_data[:near_earth_objects])
  end

  def self.dangeroids(dangerday)
    conn = Faraday.new("https://api.nasa.gov/neo/rest/v1/feed")

    response = conn.get do |req|
      req.params["start_date"] = dangerday
      req.params["api_key"] = ENV["NASA_API_KEY"]
    end

    raw_data = JSON.parse(response.body, symbolize_names: true)

    dangeroids = raw_data[:near_earth_objects][:"#{dangerday}"].select do |asteroid|
      asteroid[:is_potentially_hazardous_asteroid]
    end

    dangeroids.map do |asteroid|
      Asteroid.new(asteroid)
    end
  end
end

class Asteroid
  attr_reader :name, :neo_reference_id
  def initialize(info)
    @name = info[:name]
    @neo_reference_id = info[:neo_reference_id]
  end
end
