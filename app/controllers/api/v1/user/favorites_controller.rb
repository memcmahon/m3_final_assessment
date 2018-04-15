class Api::V1::User::FavoritesController < ApplicationController
  before_action :find_user
  def index
    favorites = @user.favorites.map do |favorite|
      favorite_asteroids(favorite)
    end
    render json: favorites
  end

  def create
    favorite = @user.favorites.new(neo_reference_id: params[:neo_reference_id])
    if favorite.save
      favorite = favorite_asteroids(favorite)
      render json: favorite
    end
  end

  private
    def find_user
      @user = ApiKey.find_by(value: params["api_key"]).user
    end

    def favorite_asteroids(favorite)
      FavAsteroid.search(favorite)
    end
end
