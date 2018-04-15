class FavAsteroid
  def initialize(favorite, asteroid)
    @id = favorite.id
    @neo_reference_id = favorite.neo_reference_id
    @user_id = favorite.user_id
    @asteroid = Asteroid.find(asteroid)
  end

  def self.find(favorite, asteroid)
    new(favorite, asteroid)
  end
end
