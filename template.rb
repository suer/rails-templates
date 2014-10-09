gem_group :development, :test do
  gem 'rspec-rails'
end

run 'bundle install --path .bundle'

generate 'rspec:install'
remove_dir 'test'

