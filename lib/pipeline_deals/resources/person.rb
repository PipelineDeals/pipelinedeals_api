module PipelineDeals
  class Person < PipelineDeals::Resource
    has_many :deals, class_name: PipelineDeals::Deal
    has_many :documents, class_name: PipelineDeals::Document
    has_many :notes, class_name: PipelineDeals::Note
    has_many :calendar_entries, class_name: PipelineDeals::CalendarEntry
    belongs_to :company, class_name: PipelineDeals::Company
    belongs_to :user, class_name: PipelineDeals::User
    belongs_to :lead_source, class_name: PipelineDeals::LeadSource
    belongs_to :lead_status, class_name: PipelineDeals::LeadStatus
    has_many :predfined_contacts_tags, class_name: PipelineDeals::PredefinedContactsTag

    READ_ONLY_ATTRIBUTES = %w{full_name company_name user lead_status lead_source image_mobile_url predefined_contacts_tags possible_notify_user_ids company deals total_pipeline won_deals_total}

    def save
      attributes.delete_if { |k, _| READ_ONLY_ATTRIBUTES.include?(k) }
      super
    end
  end
end
