$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "environment"

Dir["./support/**/*.rb"].each do |f|
  require f
end

RSpec.configure do |config|
end