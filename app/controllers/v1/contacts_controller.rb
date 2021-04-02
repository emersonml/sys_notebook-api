module V1
class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]
  # GET /contacts
  def index
    @contacts = Contact.all

    # render json: @contacts, status: :partial_content 
    # render json: @contacts, root: true
    # render json: @contacts, only: [:name, :email]
    # render json: @contacts, expect: [:name]
    # render json: @contacts.map { |i| i.attributes.merge({ author: "trump" }) }
    # render json: @contacts, methods: :author  ### o methods tem quem está ativado no model
    # I18n.default_locale = :en
    # render json: @contacts, methods: [:f_hellO, :f_i18N] 
    # render json: @contacts, methods: [:birthdate_br]
    render json: @contacts
    # render json: @contacts
  end
  
  # GET /contacts/1
  def show
    # render json: @contact.attributes.merge({ author: "trump" }) 
    # render json: @contact, include: :kind
    # render json: {tamanho: :grande}
    # render json: { name: @contact.name, birthdate: (I18n.l(@contact.birthdate) unless @contact.birthdate.blank?)}
    # render json: @contact.to_br
    # render json: @contact, include: [:kind, :phones, :address]
    ############### AQUI COMERÇA O SERIALIZERS
    render json: @contact, include: [:kind, :phones, :address ], meta: { m_author: "meta_tramp"} # [:phones, :address] esses nao precisam pq já estou no sirializers e sao has_many e has_one 
    # render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact, include: [:kind, :phones, :address]
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      # params.require(:contact).permit(
      #   :name, :email, :birthdate, :kind_id,
      #   phones_attributes: [:id,        # o id é para o uso do update, atualizacao PATCH
      #                       :number,
      #                       :_destroy   # campo utilizado para deletar tupla com info do id ##lembrar de colocar o valor 1 (true) no _destroy dos dados enviados  | MODEL allow_destroy: true
      #                     ],
      #   address_attributes: [:id, 
      #                       :street,
      #                       :city
      #                     ]  
      # )

      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

end
end
