require 'benchmark'

task :environment do
  require "./config/environment"
end
#require 'sinatra/sprockets/rake'

desc "benchmark serailizer"
task :benchmark => :environment do
  projects = Project.all.to_a
  n = 1000

  Benchmark.bm do |x|
    x.report { n.times { ProjectSerializer.new(projects).to_json }}
  end
end

desc "check serailizer"
task :check => :environment do
  projects = Project.all.to_a
  puts ProjectSerializer.new(projects).to_json
end


desc "show all routes"
task :routes => :environment do
  show_routes(WebmateApp.routes.routes)
end

def show_routes(routes)
  routes.each do |method, method_routes|
    puts '-' * 80
    method_routes.each do |transport, routes|
      routes.each {|route| show_route(transport, route)}
    end
  end
end

def show_route(transport, route)
  puts [
    transport.to_s.upcase.rjust(4),
    route.method.to_s.upcase.rjust(6),
    route.path.to_s.ljust(50),
    "=> #{route.responder.to_s}##{route.action}"
  ].join(' ')
end
