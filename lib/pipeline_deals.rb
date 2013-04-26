require 'rubygems'
require 'active_resource'
require_relative 'collection'
require_relative 'resource'
require_relative 'resources/definitions.rb'
require_relative 'version'

Dir[File.dirname(__FILE__) + '/resources/*.rb'].each {|file| require file }

module PipelineDeals
  def self.api_key
    @api_key
  end

  def self.api_key=(key)
    @api_key = key
  end
end
