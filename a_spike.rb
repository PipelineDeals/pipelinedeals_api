require 'rubygems'
require 'active_resource'
require 'pry'

class PldCollection < ActiveResource::Collection
  attr_accessor :pagination
  def initialize(parsed = {})
    @pagination = parsed['pagination']
    @elements = parsed['entries']
  end
end

class PldResource < ActiveResource::Base
  self.site = "http://localhost:3000/api/v3"
  self.collection_parser = PldCollection

  def self.find(*arguments)
    scope = arguments.slice!(0)
    options = arguments.slice!(0) || {}

    if options[:params]
      options[:params].merge!({api_key: 'n8PJJWRsx0MxgOEwGk7'})
    else
      options.merge!({params: {api_key: 'n8PJJWRsx0MxgOEwGk7'}})
    end

    super(scope, options)
  end

  def save
    prefix_options[:api_key] = 'n8PJJWRsx0MxgOEwGk7'
    self.include_root_in_json = true
    super
  end
end

class Person < PldResource
end

class Deal < PldResource
  has_many :people
end

#################################o
# Finding a single and putting
#################################o

# deal = Deal.find(1)
# $stdout << "found, deal = #{deal.inspect}\n"
# deal.name = 'blah2'
# $stdout << "About to save name:\n"
# deal.people
# deal.person_ids
# deal.custom_fields.custom_label_29 = 345
#deal.save

#################################o
# fetching collections
#################################o

# deals = Deal.find(:all)
# deals = Deal.find(:all, params: {per_page: 5, page: 2})
# deals = Deal.find(:all, params: {conditions: {deal_name: 'blah'}})
# deals = Deal.where(conditions: {deal_name: 'blah'})


#################################o
# creating
#################################o

deal = Deal.new(name: 'yeah2')
20.times {deal.save }
