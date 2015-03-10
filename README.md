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

Copy dot.env to .env.
And then set environment variables.

You should set environment variables as follows:
```
OMNIAUTH_PROVIDER=github
OMNIAUTH_ARGS="['GITHUB_KEY','GITHUB_SECRET']"
```

See [config/initializers/devise.rb](https://github.com/suer/rails-templates/blob/master/config/initializers/devise.rb)

#### DEVISE\_SECRET\_KEY

Generate secret key

```
bundle exec rake secret
```

License
------------------

[The MIT License (MIT)](http://opensource.org/licenses/mit-license)
Copyright (c) 2015 suer
