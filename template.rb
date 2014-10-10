# RSpec
gem_group :development, :test do
  gem 'rspec-rails'
end

run 'bundle install --path .bundle'

generate 'rspec:install'
remove_dir 'test'

# Slim
gem 'slim-rails'
run 'bundle install --path .bundle'

# config
application <<-GENERATORS
config.generators.test_framework = :rspec
    config.generators.template_engine = :slim
    config.generators.stylesheets = false
    config.generators.javascripts = false
GENERATORS

# devise
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem 'settingslogic'
route <<ROUTE
  devise_for :users, controllers: { omniauth_callbacks: 'authentication' }
  devise_scope :user do
    get 'sign_in', to: 'authentication#login', as: :new_user_session
    delete 'sign_out', to: 'authentication#logout', as: :destroy_user_session
  end
ROUTE

# top page
remove_file 'app/views/layouts/application.html.erb'
get 'https://raw.githubusercontent.com/suer/rails-templates/master/app/views/layouts/application.html.slim', './app/views/layouts/application.html.slim'
generate :controller, 'top index'
route "root to: 'top\#index'"

run 'bundle exec spring stop'
