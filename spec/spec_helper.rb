require 'rubygems'
require 'vcr'
require 'pipeline_deals'
require 'pry'

require 'pipeline_deals/pagination_spec'
require 'pipeline_deals/has_documents'
require 'pipeline_deals/has_notes'
require 'pipeline_deals/has_calendar_entries'
require 'pipeline_deals/has_people'
require 'pipeline_deals/has_deals'

PipelineDeals::Resource.site = ENV['PIPELINEDEALS_URL'] || "http://localhost:3000"

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
