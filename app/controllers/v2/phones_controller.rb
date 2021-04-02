module V2
class PhonesController < ApplicationController
  before_action :set_contact

# POST /contacts/1/phones
def create
  @contact.phones << Phone.new(f_phonesParams)
  if
    @contact.save
    render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
  else
    render json: @contact.errors, status: :unprocessable_entity
  end
end

  # PATH /contacts/1/phones
  def update
    # puts ">>>>>>>>>>>>>>>>> #{f_phoneParams}"
    phone = Phone.find(f_phoneParams[:id])
    
    
    if phone.update(f_phoneParams)  # phone.save  ## !!! no update ele ja dar o save
      render json: @contact.phones
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end
  
  def show
    render json: @contact.phones
  end

  # DELETE /contacts/1
  def destroy
    phone = Phone.find(f_phoneParams[:id])
    phone.destroy  

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
        @contact = Contact.find(params[:contact_id])
    end

    def f_phoneParams
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
    

end
end
