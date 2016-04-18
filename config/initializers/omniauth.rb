OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1700072783595350', '57743756ef3a6a29026f2e6567bd147d', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
