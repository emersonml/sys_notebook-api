require 'rails_helper'

describe V1::ContactsController, type: :controller do

    it 'request index and return 406 NOT ACCEPTABLE' do
        # request.accept = 'application/vnd.api+json'
        get :index
        # expect(response.status).to eql(406)
        # expect(response.status).to eql(:not_acceptable) # eql confere com o numero e nao com o simbolo entao aqui vai dar errado
        expect(response).to have_http_status(:not_acceptable) # usando os simbolos

    end
    ## OUTRA FORMA 
    it 'request index and return 200 OK' do
        request.accept = 'application/vnd.api+json'
        get :index
        # expect(response).to have_http_status(200) 
        expect(response).to have_http_status(:ok)#  usando os simbolos
    end
    
    it 'resquest index and return '
end


# bundle exec rspec --format documentation ##i mostra o que tem dentro do it
##i --format documentation posso colocar no arq .rspec para ficar automático
