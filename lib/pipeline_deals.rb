require 'rubygems'
require 'active_resource'
require_relative 'pipeline_deals/resources'
require_relative 'pipeline_deals/version'
require_relative 'pipeline_deals/resources/definitions'

Dir[File.dirname(__FILE__) + '/resources/*.rb'].each {|file| p "requring #{file}"; require file }

module PipelineDeals
  class << self
    attr_accessor :app_key, :api_key, :app_version

    def site
      PipelineDeals::Resource.site
    end

    def site=(site)
      PipelineDeals::Resource.site = site
    end

  end

  def self.configure
    yield self
    true
  end
end
