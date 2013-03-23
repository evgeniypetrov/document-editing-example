source "https://rubygems.org"

#gem 'webmate', git: 'git://github.com/webmaterb/webmate.git'
#gem 'webmate-authentication', git: 'git://github.com/webmaterb/webmate-authentication.git'

gem 'sinatra-contrib', git: 'git://github.com/sinatra/sinatra-contrib.git'

gem 'webmate', path: '/Users/malleus/projects/current/new_workmate/webmate'
gem 'webmate-authentication', path: '/Users/malleus/projects/current/new_workmate/webmate-authentication'

gem 'slim'
gem 'bson_ext'
gem 'mongo'
gem 'mongoid', '3.1.2'
gem 'carrierwave-mongoid'
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
  #gem 'debugger'
  gem 'capistrano', '2.13.5'
  gem 'capistrano-rbenv', '0.0.8'
end

group :test do
  gem 'rspec'
  gem 'rack-test', :require => "rack/test"
end
