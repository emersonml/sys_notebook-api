require 'rack'

app = Proc.new do |env|
#   [ 200, { "Content-Type" => "text/plain" }, env ]
  # [ 200, { "Content-Type" => "text/html" }, ['A barebones rack app.'] ]
  [ 200, { "Content-Type" => "text/html" }, ["#{env}"] ]
end

Rack::Handler::WEBrick.run(app, Port: 3000, Host: '45.177.133.13' ) 