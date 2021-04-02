class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city


  link(:contact) { contact_url(object.id)}


  
end
