require "administrate/base_dashboard"

class MeetingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    academic_discussed_other: Field::String,
    academic_outcomes_other: Field::String,
    advice_category: Field::String,
    advisor: Field::BelongsTo,
    advisor_discussed: Field::Text,
    advisor_notes: Field::Text,
    advisor_outcomes: Field::Text,
    advisor_type: Field::String,
    career_discussed_other: Field::String,
    career_outcomes_other: Field::String,
    date: Field::DateTime,
    event: Field::HasOne,
    event_id: Field::Number,
    graduated_student: Field::Boolean,
    location: Field::String,
    m_status: Field::String,
    nbme_form: Field::String.with_options(searchable: false),
    notes: Field::Text,
    qbank_info: Field::String.with_options(searchable: false),
    study_resources: Field::Text,
    study_resources_other: Field::String,
    subject: Field::String,
    user: Field::BelongsTo,
    uworld_info: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    academic_discussed_other
    academic_outcomes_other
    advice_category
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    academic_discussed_other
    academic_outcomes_other
    advice_category
    advisor
    advisor_discussed
    advisor_notes
    advisor_outcomes
    advisor_type
    career_discussed_other
    career_outcomes_other
    date
    event
    event_id
    graduated_student
    location
    m_status
    nbme_form
    notes
    qbank_info
    study_resources
    study_resources_other
    subject
    user
    uworld_info
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    academic_discussed_other
    academic_outcomes_other
    advice_category
    advisor
    advisor_discussed
    advisor_notes
    advisor_outcomes
    advisor_type
    career_discussed_other
    career_outcomes_other
    date
    event
    event_id
    graduated_student
    location
    m_status
    nbme_form
    notes
    qbank_info
    study_resources
    study_resources_other
    subject
    user
    uworld_info
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

  # Overwrite this method to customize how meetings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(meeting)
  #   "Meeting ##{meeting.id}"
  # end
end
