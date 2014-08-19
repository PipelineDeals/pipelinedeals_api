require 'rubygems'
require 'vcr'
require 'pipeline_deals'

begin
  require 'pry'
rescue LoadError
end

require 'support/pagination_spec'
require 'support/has_documents'
require 'support/has_notes'
require 'support/has_calendar_entries'
require 'support/has_people'
require 'support/has_deals'

PipelineDeals::Resource.site = ENV['PIPELINEDEALS_URL'] || "http://localhost:3000"
PipelineDeals.api_key = ENV['PIPELINEDEALS_API_KEY'] || 'iJHyFkMUBSfjUovt29'

#ActiveResource::Base.logger = Logger.new(STDOUT)

VCR.configure do |c|
  c.cassette_library_dir     = './spec/cassettes'
  c.hook_into                :webmock
  c.default_cassette_options = { :record => :new_episodes }
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end

def cassette(append)
  "#{described_class.to_s}_#{append}"
end
