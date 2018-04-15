class DaySearchResults
  attr_reader :dangeroids, :most_dangerous_day

  def initialize(data)
    @most_dangerous_day = most_dangerous_day(data[:near_earth_objects])
    @dangeroids = dangeroids(data[:near_earth_objects], @most_dangerous_date)
  end

  def asteroids_by_day(data)
    data.transform_values do |value|
      value.select do |asteroid|
        asteroid[:is_potentially_hazardous_asteroid]
      end.count
    end
  end

  def most_dangerous_day(data)
    binding.pry
    @most_dangerous_date = asteroids_by_day(data).sort_by do |key, value|
      value
    end.last[0].to_s

    DateTime.strptime(@most_dangerous_date, "%Y-%m-%d").strftime("%B %-d, %Y")
  end

  def dangeroids(data, date)
    binding.pry
  end

  private
    attr_reader :most_dangerous_date
end
