require "administrate/base_dashboard"

class PreceptorEvalDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    comments: Field::Text,
    concern_comments: Field::String,
    grade: Field::String,
    ics1: Field::Number,
    ics2: Field::Number,
    ics4: Field::Number,
    ics6: Field::Number,
    ics7: Field::Number,
    mspe_comments: Field::Text,
    pbli1: Field::Number,
    pbli8: Field::Number,
    permission_group_id: Field::Number,
    pppd1: Field::Number,
    pppd2: Field::Number,
    pppd6: Field::Number,
    pppd9: Field::Number,
    preceptor_name: Field::String,
    professional_concerns: Field::String,
    sbpic2: Field::Number,
    sbpic4: Field::Number,
    sbpic5: Field::Number,
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
    comments
    concern_comments
    grade
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    comments
    concern_comments
    grade
    ics1
    ics2
    ics4
    ics6
    ics7
    mspe_comments
    pbli1
    pbli8
    permission_group_id
    pppd1
    pppd2
    pppd6
    pppd9
    preceptor_name
    professional_concerns
    sbpic2
    sbpic4
    sbpic5
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
    comments
    concern_comments
    grade
    ics1
    ics2
    ics4
    ics6
    ics7
    mspe_comments
    pbli1
    pbli8
    permission_group_id
    pppd1
    pppd2
    pppd6
    pppd9
    preceptor_name
    professional_concerns
    sbpic2
    sbpic4
    sbpic5
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

  # Overwrite this method to customize how preceptor evals are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(preceptor_eval)
  #   "PreceptorEval ##{preceptor_eval.id}"
  # end
end
