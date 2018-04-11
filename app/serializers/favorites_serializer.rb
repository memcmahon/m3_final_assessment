class FavoritesSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :neo_reference_id
end
