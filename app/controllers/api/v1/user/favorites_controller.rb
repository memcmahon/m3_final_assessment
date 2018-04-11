class Api::V1::User::FavoritesController < ApplicationController
  def index
    user = ApiKey.find_by(value: params["api_key"]).user
    favorites = user.favorites.map do |favorite|
      AsteroidSearchService.find(favorite)
    end
    render json: favorites
  end
end
