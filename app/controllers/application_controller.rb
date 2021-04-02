class ApplicationController < ActionController::API

    before_action :ensure_json_request #trava para garantir ensure que a application só responda quem solicitar /JSON/
    
    def ensure_json_request  
        return if request.headers["Accept"] =~ /vnd\.api\+json/  # foi necessario escapar pq /aqui/ é uma EXPRESSAO REGULAR
        # render :nothing => true, :status => 406 ##i  nothing está sendo descontinuado
        render body: nil, :status => 406
    end
      
end
