Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,'ZipEyEICXwvpfcakwaXLQx3Cl', '7HQtII711DjzRoc5ZrT9RHPhBb0CI90J7TF5n0wOtozAAZKyzf'

  provider :facebook, '621808167958804','c9894a6a0dc7fcf1e18c03ca24dbb053',
           scope: 'public_profile, email', info_fields: 'id,name,link,email'
          
           
  provider :identity, on_failed_registration: lambda { |env|
    IdentitiesController.action(:new).call(env)
  }
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET"],
           scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name: 'google'

  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'],
           scope: 'r_basicprofile',
           fields: ['id', 'first-name', 'last-name', 'location', 'picture-url', 'public-profile-url']
  
  OmniAuth.config.on_failure = Proc.new do |env|
    SessionsController.action(:auth_failure).call(env)
    # error_type = env['omniauth.error.type']
    # new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
    # [301, {'Location' => new_path, 'Content-Type' => 'text/html'}, []]
  end
end