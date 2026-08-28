require "administrate/base_dashboard"

class NewCompetencyDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    user: Field::BelongsTo,
    email: Field::String,
    student_uid: Field::String,
    permission_group_id: Field::Number,
    medhub_id: Field::String,
    course_id: Field::String,
    course_name: Field::String,
    start_date: Field::Date,
    end_date: Field::Date,
    submit_date: Field::Date,
    final_grade: Field::String,
    evaluator: Field::String,
    ics1: Field::Number,
    ics2: Field::Number,
    ics3: Field::Number,
    ics4: Field::Number,
    ics5: Field::Number,
    mk1: Field::Number,
    mk2: Field::Number,
    mk3: Field::Number,
    pbli1: Field::Number,
    pbli2: Field::Number,
    pbli3: Field::Number,
    pcp1: Field::Number,
    pcp2: Field::Number,
    pcp3: Field::Number,
    pppd1: Field::Number,
    pppd2: Field::Number,
    sbp1: Field::Number,
    mspe: Field::Text,
    feedback: Field::Text,
    overall_summ_comm_perf: Field::Text,
    prof_concerns: Field::Text,
    add_comm_on_perform: Field::Text,
    clinic_exp_comment: Field::Text,
    comm_prof_concerns: Field::Text,
    environment: Field::String,
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
    user
    permission_group_id
    email
    student_uid
    medhub_id
    course_id
    course_name
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    add_comm_on_perform
    clinic_exp_comment
    comm_prof_concerns
    course_id
    course_name
    email
    end_date
    environment
    evaluator
    feedback
    final_grade
    ics1
    ics2
    ics3
    ics4
    ics5
    medhub_id
    mk1
    mk2
    mk3
    mspe
    overall_summ_comm_perf
    pbli1
    pbli2
    pbli3
    pcp1
    pcp2
    pcp3
    permission_group_id
    pppd1
    pppd2
    prof_concerns
    sbp1
    start_date
    student_uid
    submit_date
    user
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    permission_group_id
    email
    student_uid
    medhub_id
    course_id
    course_name
    start_date
    end_date
    submit_date
    evaluator
    final_grade
    ics1
    ics2
    ics3
    ics4
    ics5
    mk1
    mk2
    mk3
    pbli1
    pbli2
    pbli3
    pcp1
    pcp2
    pcp3
    pppd1
    pppd2
    sbp1
    prof_concerns
    mspe
    feedback
    overall_summ_comm_perf
    add_comm_on_perform
    clinic_exp_comment
    comm_prof_concerns
    environment
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

  # Overwrite this method to customize how new competencies are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(new_competency)
  #   "NewCompetency ##{new_competency.id}"
  # end
end
