class Asteroid
  attr_reader :name, :neo_reference_id
  def initialize(info)
    @name = info[:name]
    @neo_reference_id = info[:neo_reference_id]
  end
end
