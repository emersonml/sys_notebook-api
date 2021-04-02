module V2
class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :att_author
  
  belongs_to :kind, optional: true do  ### false obriga colocar um tipo
    # link(:related) { kind_url(object.kind.id)} # desativado por nao ser RELACIONAMENTO DE ROTAS
    link(:related) { v2_contact_kind_url(object.id)}
  end
  has_many :phones do ###!!!  phones fica no plural para indicar que tem muitos  ### phones nao tem Controller ele usa o controller do contacts que cadastrar seus dados na sua tabela atraves do nested no model
    link(:related) { v2_contact_phones_url(object.id)}
  end
  
  has_one :address do ### contato só tem 1 endereço
    link(:related) { v2_contact_address_url(object.id)}
  end
  
  link(:contact) { v2_contact_url(object.id)}
  link(:kind) { kind_path(object.kind.id)}



  meta do   ### mete do ===>> aparece como dentro de data no mesma posicao q o relationships
    {
      m_do_autor: "meta_do_tramp"
    }
  end
  def att_author
    "attributes tramp"    
  end
  
  def attributes(*args)
    h = super(*args)
    # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank? ) # pt-BR 
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?  # formato iso8601  .to_time.iso8601
    h        
  end

end
end
