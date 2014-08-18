module PipelineDeals
  class Company < PipelineDeals::Resource
    has_many :deals, class_name: PipelineDeals::Deal
    has_many :people, class_name: PipelineDeals::Person
    has_many :documents, class_name: PipelineDeals::Document
    has_many :notes, class_name: PipelineDeals::Note
    has_many :calendar_entries, class_name: PipelineDeals::CalendarEntry

    READ_ONLY_ATTRIBUTES = %w{image_thumb_url image_mobile_url possible_notify_user_ids deals total_pipeline won_deals_total}

    def save
      attributes.delete_if { |k, _| READ_ONLY_ATTRIBUTES.include?(k) }
      super
    end
  end
end

