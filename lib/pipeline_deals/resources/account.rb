module PipelineDeals
  class Account < PipelineDeals::Resource
    include ActiveResource::Singleton
    def self.account(options = {})
      add_keys(options[:params] ||= {})
      find(options)
    end
  end
end
