module PipelineDeals
  class User < PipelineDeals::Resource
    has_many :deals, class_name: PipelineDeals::Deal
  end
end

