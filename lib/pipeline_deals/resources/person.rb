module PipelineDeals
  class Person < PipelineDeals::Resource
    has_many :deals, class_name: PipelineDeals::Deal
    has_many :documents, class_name: PipelineDeals::Document
    has_many :notes, class_name: PipelineDeals::Note
    has_many :calendar_entries, class_name: PipelineDeals::CalendarEntry, as: :association
    belongs_to :company, class_name: PipelineDeals::Company
    belongs_to :user, class_name: PipelineDeals::User
    belongs_to :lead_source, class_name: PipelineDeals::LeadSource
    belongs_to :lead_status, class_name: PipelineDeals::LeadStatus
    has_and_belongs_to_many :predfined_contacts_tags, class_name: PipelineDeals::PredefinedContactsTag
  end
end
