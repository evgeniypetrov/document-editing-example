# add directory to application load paths
# configatron.app.load_paths << ["app/helpers"]

Webmate::Application.configure do |config|
  # add directory to application load paths
  configatron.app.load_paths << ["app/uploaders"]
end

Webmate::Application.configure(:development) do |config|
  config.app.cache_classes = false
  config.assets.compile = true
  config.websockets.enabled = true
  config.websockets.port = 3503
  config.websockets.namespace = 'api'
end

Webmate::Application.configure(:production) do |config|
  config.app.cache_classes = true
  config.assets.compile = false
  config.websockets.enabled = true
  config.websockets.port = 9020
  config.websockets.namespace = 'api'
end
