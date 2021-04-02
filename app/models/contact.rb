class Contact < ApplicationRecord
    belongs_to :kind, optional: true  ### false obriga colocar um tipo
    has_many :phones ###!!!  phones fica no plural para indicar que tem muitos
                     ### phones nao tem Controller ele usa o controller do contacts que cadastrar seus dados na sua tabela atraves do nested no model
    has_one :address  ### contato só tem 1 endereço
    accepts_nested_attributes_for :phones,
                                  allow_destroy: true # Permitir deletar um atributo do contact = uma tupla do phones | CONTROLLER  permitir   :_destroy
    accepts_nested_attributes_for :address, update_only: true # update_only diz q é para apenas atualizar e nao criar um novo registro ## https://api.rubyonrails.org/v6.1.0/classes/ActiveRecord/NestedAttributes/ClassMethods.html
    
    def as_json(options={})
        h = super(options)
        h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank? )
        h        
    end
    



    ########################################
    # def author
    #     "trump"        
    # end
    # def kind_description
    #     self.kind.description
        
    # end
    
    # def as_json(options={})  
    #     super(                   ### todas as configs podem ser feitas no controller 
    #         root: true,
    #         methods: [:author, :kind_description],
    #         include: {kind: { only: :description} } 
    #     )
    # end
    
###################
    # def f_hellO
    #     I18n.t('hello')
    # end
    # def f_i18N
    #     I18n.default_locale        
    # end
    
    # def birthdate_br
    #   I18n.l(self.birthdate) unless self.birthdate.blank?
    # end
    
    def to_br
     {
        name: self.name, 
        email: self.email,
        birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
     }
    end
    
    
end
