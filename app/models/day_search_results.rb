class DaySearchResults
  attr_reader :dangeroids, :most_dangerous_day

  def initialize(data)
    @most_dangerous_day = danger_day(data[:near_earth_objects])
    @dangeroids = hazardous_asteroids(data[:near_earth_objects], @most_dangerous_date)
  end

  def self.search(start_date, end_date)
    NasaSearchService.get_danger_day(start_date, end_date)
  end

  def self.results(data)
    new(data)
  end

  def asteroids_by_day(data)
    data.transform_values do |value|
      value.select do |asteroid|
        asteroid[:is_potentially_hazardous_asteroid]
      end.count
    end
  end

  def danger_day(data)
    @most_dangerous_date = asteroids_by_day(data).sort_by do |key, value|
      value
    end.last[0].to_s

    DateTime.strptime(@most_dangerous_date, "%Y-%m-%d").strftime("%B %-d, %Y")
  end

  def hazardous_asteroids(data, date)
    data[:"#{date}"].map do |asteroid|
      if asteroid[:is_potentially_hazardous_asteroid]
        Asteroid.find(asteroid)
      end
    end.compact
  end

  private
    attr_reader :most_dangerous_date
end
