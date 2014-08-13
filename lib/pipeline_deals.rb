require 'rubygems'
require 'active_resource'
require_relative 'pipeline_deals/resources'
require_relative 'pipeline_deals/version'
require_relative 'pipeline_deals/resources/definitions'

Dir[File.dirname(__FILE__) + '/resources/*.rb'].each {|file| p "requring #{file}"; require file }

module PipelineDeals
  def self.api_key
    @api_key
  end

  def self.api_key=(api_key)
    @api_key = api_key
  end

  def self.app_key
    @app_key
  end

  def self.app_key=(app_key)
    @app_key = app_key
  end
end
