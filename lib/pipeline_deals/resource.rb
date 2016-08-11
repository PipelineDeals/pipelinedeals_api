module PipelineDeals
  class Resource < ActiveResource::Base
    self.site = "https://api.pipelinedeals.com"
    self.prefix = "/api/v3/"
    self.collection_parser = PipelineDeals::Collection

    def self.find(*arguments)
      scope = arguments.slice!(0)
      options = arguments.slice!(0) || {}

      add_keys(options[:params] ||= {})

      super(scope, options)
    end

    def save
      PipelineDeals::Resource.add_keys(prefix_options)
      self.include_root_in_json = true
      super
    end

    def self.add_keys(hash)
      hash[:api_key] = PipelineDeals.api_key unless PipelineDeals.account_key
      hash[:account_key] = PipelineDeals.account_key if PipelineDeals.account_key

      hash[:app_key] = PipelineDeals.app_key if PipelineDeals.app_key
      hash[:app_version] = PipelineDeals.app_version if PipelineDeals.app_version
    end
  end
end
