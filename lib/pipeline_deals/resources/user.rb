module PipelineDeals
  class User < PipelineDeals::Resource
    has_many :deals
  end
end

