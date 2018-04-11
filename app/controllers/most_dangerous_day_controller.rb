require 'date'

class MostDangerousDayController < ApplicationController
  def index
    # refactor dates to presenter
    @start_date = DateTime.strptime(params[:start_date], "%Y-%m-%d").strftime("%B %-d, %Y")
    @end_date = DateTime.strptime(params[:end_date], "%Y-%m-%d").strftime("%B %-d, %Y")
    @most_dangerous_day = DangerDaySearchService.most_dangerous_day(params[:start_date], params[:end_date])
  end
end

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
end

class DaySearchResults
  def initialize(data)
    @results = asteroids_by_day(data)
  end

  def self.most_dangerous_day(data)
    binding.pry
    new(data).most_dangerous_day
  end

  def asteroids_by_day(data)
    data.map
  end
end
