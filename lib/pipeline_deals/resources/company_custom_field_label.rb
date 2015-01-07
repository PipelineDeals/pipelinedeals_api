module PipelineDeals
  class CompanyCustomFieldLabel < PipelineDeals::AdminResource
    has_many :custom_field_label_dropdown_entries, class_name: PipelineDeals::CustomFieldLabelDropdownEntry
  end
end
