Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.credentials.dig(:facebook, :key), Rails.application.credentials.dig(:facebook, :secret), {:provider_ignores_state => true}
end
