$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "match_hash"

Dir["./support/**/*.rb"].each do |f|
  require f
end

RSpec.configure do |config|
end