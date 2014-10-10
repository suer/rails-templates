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

run 'bundle exec spring stop'
