module PipelineDeals
  class Person < PipelineDeals::Resource
    has_many :deals, :class_name => PipelineDeals::Deal
    has_many :people, :class_name => PipelineDeals::Company
  end
end

