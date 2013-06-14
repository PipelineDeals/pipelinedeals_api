require 'rubygems'
require 'active_resource'
require_relative 'pipeline_deals/collection'
require_relative 'pipeline_deals/resource'
require_relative 'pipeline_deals/admin_resource'
require_relative 'pipeline_deals/resources/definitions.rb'
require_relative 'pipeline_deals/version'

Dir[File.dirname(__FILE__) + '/resources/*.rb'].each {|file| require file }

module PipelineDeals
  def self.api_key
    @api_key
  end

  def self.api_key=(key)
    @api_key = key
  end
end
