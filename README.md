Rails Application Templates
===================================

Create new apps
------------------

```
$ gem install rails
$ mkdir myapp
$ cd myapp
$ rails new . -m https://raw.githubusercontent.com/suer/rails-templates/master/template.rb
```

Main Modules
------------------

* Slim
* Devise
* Bootstrap
* RSpec

Environment variables for Devise
-----------------------------------

You should set **OMNIAUTH_PROVIDER**, **OMNIAUTH_ARGS**.

For example, omniauth-github needs an initializer as follows:
```ruby
Devise.setup do |config|
  config.omniauth :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end
```

then you should set environment variables as follows:
```
export OMNIAUTH_PROVIDER=github
export OMNIAUTH_ARGS="['GITHUB_KEY','GITHUB_SECRET']"
```

See [config/initializers/devise.rb](https://github.com/suer/rails-templates/blob/master/config/initializers/devise.rb)

License
------------------

[The MIT License (MIT)](http://opensource.org/licenses/mit-license)
Copyright (c) 2014 suer
