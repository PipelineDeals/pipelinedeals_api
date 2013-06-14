require 'rubygems'
require 'vcr'
require 'pipeline_deals'
require 'pry'

PipelineDeals::Resource.site = "http://localhost:3000"

ActiveResource::Base.logger = Logger.new(STDOUT)

VCR.configure do |c|
  c.cassette_library_dir     = './spec/cassettes'
  c.hook_into                :webmock
  c.default_cassette_options = { :record => :new_episodes }
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end
