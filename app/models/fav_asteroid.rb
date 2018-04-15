class FavAsteroid
  def initialize(favorite, asteroid)
    @id = favorite.id
    @neo_reference_id = favorite.neo_reference_id
    @user_id = favorite.user_id
    @asteroid = Asteroid.find(asteroid)
  end

  def self.search(favorite)
    new(favorite, NasaSearchService.get_asteroid(favorite))
  end
end
