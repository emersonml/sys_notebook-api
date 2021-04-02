module V1
class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number

  link(:contact) { contact_url(object.id)}
  
end
end
