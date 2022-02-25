class MovieSerializer < ActiveModel::Serializer
  attributes :id, :image, :title, :creationdate, :qualification
  has_one :genre
end
