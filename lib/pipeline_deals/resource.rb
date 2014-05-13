module PipelineDeals
  class Resource < ActiveResource::Base
    self.site = "https://api.pipelinedeals.com"
    self.prefix = "/api/v3/"
    self.collection_parser = PipelineDeals::Collection


    def self.find(*arguments)
      scope = arguments.slice!(0)
      options = arguments.slice!(0) || {}

      self.add_params(options, app_key: PipelineDeals.app_key) if PipelineDeals.app_key
      self.add_params(options, api_key: PipelineDeals.api_key)

      super(scope, options)
    end

    def save
      prefix_options[:app_key] = PipelineDeals.app_key if PipelineDeals.app_key
      prefix_options[:api_key] = PipelineDeals.api_key
      self.include_root_in_json = true
      super
    end

    def self.add_params(options, params)
      if options[:params]
        options[:params].merge!(params)
      else
        options.merge!({params: params})
      end
    end
  end
end
