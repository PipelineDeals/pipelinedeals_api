module PipelineDeals
  class Resource < ActiveResource::Base
    self.collection_parser = PipelineDeals::Collection
    self.include_root_in_json = true
    self.prefix = "/api/v3/"
    self.site = "https://api.pipelinedeals.com"

    def self.add_keys(hash)
      hash[:api_key] = PipelineDeals.api_key unless PipelineDeals.account_key
      hash[:account_key] = PipelineDeals.account_key if PipelineDeals.account_key

      hash[:app_key] = PipelineDeals.app_key if PipelineDeals.app_key
      hash[:app_version] = PipelineDeals.app_version if PipelineDeals.app_version
    end

    def self.find(*arguments)
      scope = arguments.slice!(0)
      options = arguments.slice!(0) || {}

      add_keys(options[:params] ||= {})

      super(scope, options)
    end

    def save
      PipelineDeals::Resource.add_keys(prefix_options)

      super
    end
  end
end
