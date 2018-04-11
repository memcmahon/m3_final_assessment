class DaySearchResults
  def initialize(data)
    @results = asteroids_by_day(data)
  end

  def self.most_dangerous_day(data)
    new(data).most_dangerous_day
  end

  def asteroids_by_day(data)
    data.transform_values do |value|
      value.select do |asteroid|
        asteroid[:is_potentially_hazardous_asteroid]
      end.count
    end
  end

  def most_dangerous_day
    day = @results.sort_by do |key, value|
      value
    end.last[0].to_s

    @dangerday = DateTime.strptime(day, "%Y-%m-%d").strftime("%B %-d, %Y")
  end

  def self.dangeroids
    DangerDaySearchService.dangeroids(@dangerday)
  end
end
