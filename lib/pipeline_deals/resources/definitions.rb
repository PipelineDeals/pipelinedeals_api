module PipelineDeals
  class Deal < PipelineDeals::Resource; end
  class Person < PipelineDeals::Resource; end
  class Company < PipelineDeals::Resource; end
  class Activity < PipelineDeals::Resource; end
  class CalendarEntry < PipelineDeals::Resource; end
  class CalendarTask < PipelineDeals::Resource; end
  class CalendarEvent < PipelineDeals::Resource; end
  class Document < PipelineDeals::Resource; end
  class User < PipelineDeals::Resource; end
  class Note < PipelineDeals::Resource;

  class DealStage < PipelineDeals::AdminResource; end
  class NoteCategory < PipelineDeals::AdminResource; end
  class DealCustomFieldLabel < PipelineDeals::AdminResource; end
  class PersonCustomFieldLabel < PipelineDeals::AdminResource; end
  class CompanyCustomFieldLabel < PipelineDeals::AdminResource; end
  class CustomFieldLabelDropdownEntry < PipelineDeals::AdminResource; end
  class LeadStatus < PipelineDeals::AdminResource; end
  class LeadSource < PipelineDeals::AdminResource; end
  class PredefinedContactTag < PipelineDeals::AdminResource; end
  class EventCategory < PipelineDeals::AdminResource; end
end
