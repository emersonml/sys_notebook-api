Rails.application.routes.draw do
  resources :kinds
  
  # constraints subdomain: 'v1' do
    # scope module: 'v1' do
    api_version(:module => "V1", :path => {:value => "v1"}) do
      resources :contacts do #, :constraints => lambda { |request| request.params[:version] == "1" }  do
        resource :kind, only: [:show]
        resource :kind, only: [:show], path: 'relationships/kind'

        resource :phones, only: [:show]
        resource :phones, only: [:show], path: 'relationships/phones'
        resource :phone, only: [:update, :create, :destroy]
        resource :phone, only: [:update, :create, :destroy], path: 'relationships/phone'
      
        resource :address, only: [:show, :update, :create, :destroy]
        resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
      end
    end


  # constraints subdomain: 'v1' do
    # scope module: 'v1' do
    api_version(:module => "V2", :path => {:value => "v2"}) do
      resources :contacts do #, :constraints => lambda { |request| request.params[:version] == "1" }  do
        resource :kind, only: [:show]
        resource :kind, only: [:show], path: 'relationships/kind'

        resource :phones, only: [:show]
        resource :phones, only: [:show], path: 'relationships/phones'
        resource :phone, only: [:update, :create, :destroy]
        resource :phone, only: [:update, :create, :destroy], path: 'relationships/phone'
      
        resource :address, only: [:show, :update, :create, :destroy]
        resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
      end
    end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
