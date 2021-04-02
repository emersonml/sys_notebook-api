

unless Rails.env.test?
   Rails.application.config.middleware.use AppName, "Nottebook api"
end