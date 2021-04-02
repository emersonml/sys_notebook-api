module V2
class AddressesController < ApplicationController
  before_action :set_contact




# POST /contactS/1/address
def create
  @contact.address = Address.new(f_addressParams)
  if
    @contact.save
    render json: @contact.address, status: :created, location: contact_address_url(@contact)
  else
    render json: @contact.errors, status: :unprocessable_entity
  end
end

  # PATH /contactS/1/address
  def update
    if
      @contact.address.update(f_addressParams)
      render json: @contact.address
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end
  
  def show
    render json: @contact.address
  end

  # DELETE /contacts/1
  def destroy
    @contact.address.destroy  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
        @contact = Contact.find(params[:contact_id])
    end
    def f_addressParams
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      
    end
    

end
end
