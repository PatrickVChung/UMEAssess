require "administrate/base_dashboard"

class FormativeFeedbackDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    block_code: Field::String,
    csa_code: Field::String,
    q1: Field::String,
    q2: Field::String,
    q3: Field::String,
    q4: Field::String,
    q5: Field::String,
    q6: Field::String,
    q7: Field::String,
    q8: Field::String,
    response_id: Field::String,
    submit_date: Field::Date,
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
    block_code
    csa_code
    q1
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    block_code
    csa_code
    q1
    q2
    q3
    q4
    q5
    q6
    q7
    q8
    response_id
    submit_date
    user
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    block_code
    csa_code
    q1
    q2
    q3
    q4
    q5
    q6
    q7
    q8
    response_id
    submit_date
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

  # Overwrite this method to customize how formative feedbacks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(formative_feedback)
  #   "FormativeFeedback ##{formative_feedback.id}"
  # end
end
