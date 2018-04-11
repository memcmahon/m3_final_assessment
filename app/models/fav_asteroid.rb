class FavAsteroid
  def initialize(favorite, asteroid)
    @id = favorite.id
    @neo_reference_id = favorite.neo_reference_id
    @user_id = favorite.user_id
    @asteroid = Asteroid.new(asteroid)
  end
end
