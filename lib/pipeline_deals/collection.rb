module PipelineDeals
  class Collection < ActiveResource::Collection
    attr_accessor :pagination
    def initialize(parsed = {})
      @pagination = parsed['pagination']
      @elements = parsed['entries']
    end
  end
end
