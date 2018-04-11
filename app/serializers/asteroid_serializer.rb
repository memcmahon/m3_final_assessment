class AsteroidSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_potentially_hazardous
end
