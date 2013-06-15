module PipelineDeals
  class Collection < ActiveResource::Collection
    attr_accessor :pagination
    def initialize(parsed = {})
      @pagination = HashWithIndifferentAccess.new(parsed['pagination'])
      @elements = parsed['entries']
    end
  end
end
