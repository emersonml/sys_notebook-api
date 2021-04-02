module V1
class KindSerializer < ActiveModel::Serializer
  attributes :id, :description


  # link(:contact) { contact_url(object.id)}


  
end
end
