remove_file 'Gemfile.lock'

# gems for development
gem_group :development, :test do
  gem 'rspec-rails'
  gem 'quiet_assets'
end

run 'bundle install --path .bundle'

generate 'rspec:install'
remove_dir 'test'
remove_file 'spec/rails_helper.rb'
get 'https://raw.githubusercontent.com/suer/rails-templates/master/spec/rails_helper.rb', 'spec/rails_helper.rb'

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

gsub_file('config/environments/production.rb', /config\.serve_static_assets = false/, 'config.serve_static_assets = true')

# devise
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem 'dotenv-rails'
run 'bundle install --path .bundle'
get 'https://raw.githubusercontent.com/suer/rails-templates/master/app/models/dotenv_config.rb', 'app/models/dotenv_config.rb'
generate 'devise:install'
route <<ROUTE
devise_for :users, controllers: { omniauth_callbacks: 'authentication' }
  devise_scope :user do
    get 'sign_in', to: 'authentication#login', as: :new_user_session
    delete 'sign_out', to: 'authentication#logout', as: :destroy_user_session
  end
ROUTE
get 'https://raw.githubusercontent.com/suer/rails-templates/master/app/models/user.rb', 'app/models/user.rb'
get 'https://raw.githubusercontent.com/suer/rails-templates/master/app/controllers/authentication_controller.rb', 'app/controllers/authentication_controller.rb'

remove_file 'config/initializers/devise.rb'
get 'https://raw.githubusercontent.com/suer/rails-templates/master/config/initializers/devise.rb', 'config/initializers/devise.rb'
get 'https://raw.githubusercontent.com/suer/rails-templates/master/db/migrate/20140720020818_devise_create_users.rb', 'db/migrate/20140720020818_devise_create_users.rb'
run 'bundle exec rake db:migrate'

# top page
remove_file 'app/views/layouts/application.html.erb'
get 'https://raw.githubusercontent.com/suer/rails-templates/master/app/views/layouts/application.html.slim', 'app/views/layouts/application.html.slim'
generate :controller, 'top index'
get 'https://raw.githubusercontent.com/suer/rails-templates/master/app/views/top/index.html.slim', 'app/views/top/index.html.slim', force: true
get 'https://raw.githubusercontent.com/suer/rails-templates/master/app/controllers/top_controller.rb', 'app/controllers/top_controller.rb', force: true
route "root to: 'top\#index'"

get 'https://raw.githubusercontent.com/suer/rails-templates/master/app/assets/javascripts/application.js', 'app/assets/javascripts/application.js', force: true

remove_file 'app/assets/stylesheets/application.css'
get 'https://raw.githubusercontent.com/suer/rails-templates/master/app/assets/stylesheets/application.css.scss', 'app/assets/stylesheets/application.css.scss'
get 'https://raw.githubusercontent.com/suer/rails-templates/master/app/assets/stylesheets/main.css.scss', 'app/assets/stylesheets/main.css.scss'

route "root to: 'top\#index'"

# Bootstrap
gem 'bootstrap-sass', '~> 3.0.3.0'
run 'bundle install --path .bundle'
run 'bundle exec rails g bootstrap:install'
run 'bundle exec rails g bootstrap:layout application fluid'

# localization
get 'https://raw.githubusercontent.com/suer/rails-templates/master/config/locales/en.yml', 'config/locales/en.yml', force: true

# .gitignore
get 'https://raw.githubusercontent.com/suer/rails-templates/master/.gitignore', '.gitignore', force: true

# .env
get 'https://raw.githubusercontent.com/suer/rails-templates/master/dot.env', 'dot.env'

# thin
gem 'thin'
run 'bundle install --path .bundle'

# favicon
remove_file 'public/favicon.ico'
get 'https://raw.githubusercontent.com/suer/rails-templates/master/app/assets/images/favicon.ico', 'app/assets/images/favicon.ico'

run 'bundle exec spring stop'
