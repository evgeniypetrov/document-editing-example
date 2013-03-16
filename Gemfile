source "https://rubygems.org"

gem 'webmate', git: 'git://github.com/webmaterb/webmate.git'
#gem 'webmate-authentication', git: 'git://github.com/webmaterb/webmate-authentication.git'

gem 'slim'
gem 'bson_ext'
gem 'mongoid', '2.5.1'
gem 'active_model_serializers', git: "git://github.com/rails-api/active_model_serializers.git"

group :assets do
  gem 'therubyracer', '0.10.2'
  gem 'alphasights-sinatra-sprockets', require: 'sinatra-sprockets',
      git: 'git://github.com/droidlabs/sinatra-sprockets.git'
  gem 'coffee-script'
  gem 'sass'
  gem 'skim' # slim-coffee-assets
end

group :development do
  gem 'capistrano', '2.13.5'
  gem 'capistrano-rbenv', '0.0.8'
end

group :test do
  gem 'rspec'
  gem 'rack-test', :require => "rack/test"
end