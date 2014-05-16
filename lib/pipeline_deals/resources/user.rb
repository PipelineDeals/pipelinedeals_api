module PipelineDeals
  class User < PipelineDeals::Resource
    has_many :deals, class_name: PipelineDeals::Deal
    has_many :people, class_name: PipelineDeals::Person
  end
end

