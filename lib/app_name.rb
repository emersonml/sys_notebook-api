# module  AppName
    class AppName # < Rails::Application

        def initialize(app, app_name)
            @app = app
            @app_name = app_name
        end

        def call(env)
            # puts ">>>>>>>>>>>>>>>>>  #{env} " ## !!! importante para descobrir o que se passa nas requisicoes e responses do sistema
            if env["ORIGINAL_FULLPATH"] == "/"
                ['200', {'Content-Type' => 'text/html'}, ["Teste!"]]
            else
            status, headers, response = @app.call(env)
            headers.merge!({'X-App-Name' => "#{@app_name}"}) ##i para fazer interpolacao nao pode ser aspas simples
            [status, headers, [response.body]]
            end 
        end
        # def call(env)
        #     ['200', {'Content-Type' => 'text/html'}, ["Notebook API"]]
        #     # ['200', {'Content-Type' => 'text/html'}, ["Notebook API"]]
        # end
    
    end
#  end