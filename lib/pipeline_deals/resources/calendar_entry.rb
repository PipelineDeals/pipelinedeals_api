class PipelineDeals
  class CalendarEntry < PipelineDeals::Resource
    belongs_to :category, class_name: PipelineDeals::EventCategory, foreign_key: :category_id
    belongs_to :owner, class_name: PipelineDeals::User, foreign_key: :owner_id
    belongs_to :company, class_name: PipelineDeals::Company
  end
end
