require_relative 'collection'
require_relative 'resource'
require_relative 'admin_resource'
require_relative 'resources/definitions.rb'

Dir[File.dirname(__FILE__) + '/resources/*.rb'].each {|file| require file }
