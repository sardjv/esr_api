require "administrate/base_dashboard"

class PersonRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'PersonID' => Field::String,
    :'created_at' => Field::DateTime,
    :'updated_at' => Field::DateTime,
    :'Record Type' => Field::String,
    :'Effective StartDate' => Field::Date,
    :'Effective EndDate' => Field::Date,
    :'Employee Number' => Field::String,
    :'Title' => Field::String,
    :'LastName' => Field::String,
    :'FirstName' => Field::String,
    :'MiddleNames' => Field::String,
    :'MaidenName' => Field::String,
    :'PreferredName' => Field::String,
    :'Previous LastName' => Field::String,
    :'Gender' => Field::String,
    :'Date of Birth' => Field::Date,
    :'NationalInsurance Number' => Field::String,
    :'NHS UniqueID' => Field::String,
    :'HireDate' => Field::Date,
    :'ActualTermination Date' => Field::Date,
    :'Termination Reason' => Field::String,
    :'Employee StatusFlag' => Field::String,
    :'WTR Opt Out' => Field::String,
    :'WTR Opt Out Date' => Field::Date,
    :'Ethnic Origin' => Field::String,
    :'Country of Birth' => Field::String,
    :'Previous Employer' => Field::String,
    :'Previous EmployerType' => Field::String,
    :'CSD 3 Months' => Field::Date,
    :'CSD 12 Months' => Field::Date,
    :'NHS CRS UUID' => Field::String,
    :'System Person Type' => Field::String,
    :'User Person Type' => Field::String,
    :'Office e-mail address' => Field::String,
    :'NHS StartDate' => Field::Date,
    :'Last UpdateDate' => Field::Date,
    :'Disability Flag' => Field::String,
    :'Ins_Upd_TimeStamp' => Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :'id',
    :'PersonID',
    :'created_at',
    :'updated_at',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'PersonID',
    :'created_at',
    :'updated_at',
    :'Record Type',
    :'Effective StartDate',
    :'Effective EndDate',
    :'Employee Number',
    :'Title',
    :'LastName',
    :'FirstName',
    :'MiddleNames',
    :'MaidenName',
    :'PreferredName',
    :'Previous LastName',
    :'Gender',
    :'Date of Birth',
    :'NationalInsurance Number',
    :'NHS UniqueID',
    :'HireDate',
    :'ActualTermination Date',
    :'Termination Reason',
    :'Employee StatusFlag',
    :'WTR Opt Out',
    :'WTR Opt Out Date',
    :'Ethnic Origin',
    :'Country of Birth',
    :'Previous Employer',
    :'Previous EmployerType',
    :'CSD 3 Months',
    :'CSD 12 Months',
    :'NHS CRS UUID',
    :'System Person Type',
    :'User Person Type',
    :'Office e-mail address',
    :'NHS StartDate',
    :'Last UpdateDate',
    :'Disability Flag',
    :'Ins_Upd_TimeStamp',
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how person records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(person_record)
  #   "PersonRecord ##{person_record.id}"
  # end
end
