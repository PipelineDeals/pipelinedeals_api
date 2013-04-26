module PipelineDeals
  class Resource < ActiveResource::Base
    self.site = "https://api.pipelinedeals.com/api/v3"
    self.collection_parser = PipelineDeals::Collection

    def self.find(*arguments)
      scope = arguments.slice!(0)
      options = arguments.slice!(0) || {}

      if options[:params]
        options[:params].merge!({api_key: PipelineDeals.api_key})
      else
        options.merge!({params: {api_key: PipelineDeals.api_key}})
      end

      super(scope, options)
    end

    def save
      prefix_options[:api_key] = PipelineDeals.api_key
      self.include_root_in_json = true
      super
    end
  end
end
