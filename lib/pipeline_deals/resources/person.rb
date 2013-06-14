module PipelineDeals
  class Person < PipelineDeals::Resource
    has_many :deals, :class_name => PipelineDeals::Deal
    has_one :company, :class_name => PipelineDeals::Company
  end
end
