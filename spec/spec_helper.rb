$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'iscraper'

require 'vcr'
 
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
