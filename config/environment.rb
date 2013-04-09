WEBMATE_ROOT = File.expand_path('.')
require 'webmate'

Dir[File.join(WEBMATE_ROOT, 'app', 'routes', '**', '*.rb')].each do |file|
  require file
end

Dir[File.join(WEBMATE_ROOT, 'app', 'serializers', '**', '*.rb')].each do |file|
  require file
end
