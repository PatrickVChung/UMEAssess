require "administrate/base_dashboard"

class PreceptorAssessDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    attribute1: Field::Boolean,
    attribute1_no: Field::Text,
    attribute2: Field::Boolean,
    attribute2_no: Field::Text,
    attribute3: Field::Boolean,
    attribute3_no: Field::Text,
    concern_comments: Field::String,
    feedback: Field::Text,
    grade: Field::String,
    overall_performance: Field::Text,
    preceptor_email: Field::String,
    preceptor_name: Field::String,
    professional_concerns: Field::String,
    response_id: Field::String,
    submit_date: Field::Date,
    term: Field::String,
    user: Field::BelongsTo,
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
    attribute1
    attribute1_no
    attribute2
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    attribute1
    attribute1_no
    attribute2
    attribute2_no
    attribute3
    attribute3_no
    concern_comments
    feedback
    grade
    overall_performance
    preceptor_email
    preceptor_name
    professional_concerns
    response_id
    submit_date
    term
    user
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    attribute1
    attribute1_no
    attribute2
    attribute2_no
    attribute3
    attribute3_no
    concern_comments
    feedback
    grade
    overall_performance
    preceptor_email
    preceptor_name
    professional_concerns
    response_id
    submit_date
    term
    user
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

  # Overwrite this method to customize how preceptor assesses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(preceptor_assess)
  #   "PreceptorAssess ##{preceptor_assess.id}"
  # end
end
