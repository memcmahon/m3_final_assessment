class Api::V1::User::FavoritesController < ApplicationController
  before_action :find_user
  def index
    favorites = @user.favorites.map do |favorite|
      AsteroidSearchService.find(favorite)
    end

    render json: favorites
  end

  def create
    favorite = @user.favorites.new(neo_reference_id: params[:neo_reference_id])
    if favorite.save
      favorite = AsteroidSearchService.find(favorite)
      render json: favorite
    end
  end

  private
    def find_user
      @user = ApiKey.find_by(value: params["api_key"]).user
    end
end
