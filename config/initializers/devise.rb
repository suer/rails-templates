Devise.setup do |config|
  require 'devise/orm/active_record'
  config.secret_key = ENV['DEVISE_SECRET_KEY']
  config.sign_out_via = :delete
  provider = if ENV['OMNIAUTH_PROVIDER']
    ENV['OMNIAUTH_PROVIDER'].to_sym
  else
    :github
  end
  args =  JSON.parse(ENV['OMNIAUTH_ARGS'])
  case args
  when NilClass
    config.omniauth provider
  when Hash
    config.omniauth provider, args
  when Array
    config.omniauth provider, *args
  end
end
