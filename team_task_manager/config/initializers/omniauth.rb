Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '1136407073057489', '4ed0894d703b55349e2a8b86e7903698'
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#       provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
# end