require "administrate/base_dashboard"

class CompetencyDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    add_comm_on_perform: Field::Text,
    clinic_exp_comment: Field::Text,
    comm_prof_concerns: Field::Text,
    course_id: Field::String,
    course_name: Field::String,
    email: Field::String,
    end_date: Field::Date,
    environment: Field::String,
    evaluator: Field::String,
    feedback: Field::Text,
    final_grade: Field::String,
    ics1: Field::Number,
    ics2: Field::Number,
    ics3: Field::Number,
    ics4: Field::Number,
    ics5: Field::Number,
    ics6: Field::Number,
    ics7: Field::Number,
    ics8: Field::Number,
    medhub_id: Field::String,
    mk1: Field::Number,
    mk2: Field::Number,
    mk3: Field::Number,
    mk4: Field::Number,
    mk5: Field::Number,
    mspe: Field::Text,
    overall_summ_comm_perf: Field::Text,
    pbli1: Field::Number,
    pbli2: Field::Number,
    pbli3: Field::Number,
    pbli4: Field::Number,
    pbli5: Field::Number,
    pbli6: Field::Number,
    pbli7: Field::Number,
    pbli8: Field::Number,
    pcp1: Field::Number,
    pcp2: Field::Number,
    pcp3: Field::Number,
    pcp4: Field::Number,
    pcp5: Field::Number,
    pcp6: Field::Number,
    permission_group_id: Field::Number,
    pppd1: Field::Number,
    pppd10: Field::Number,
    pppd11: Field::Number,
    pppd2: Field::Number,
    pppd3: Field::Number,
    pppd4: Field::Number,
    pppd5: Field::Number,
    pppd6: Field::Number,
    pppd7: Field::Number,
    pppd8: Field::Number,
    pppd9: Field::Number,
    prof_concerns: Field::Text,
    sbpic1: Field::Number,
    sbpic2: Field::Number,
    sbpic3: Field::Number,
    sbpic4: Field::Number,
    sbpic5: Field::Number,
    start_date: Field::Date,
    student_uid: Field::String,
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
    add_comm_on_perform
    clinic_exp_comment
    comm_prof_concerns
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
    ics6
    ics7
    ics8
    medhub_id
    mk1
    mk2
    mk3
    mk4
    mk5
    mspe
    overall_summ_comm_perf
    pbli1
    pbli2
    pbli3
    pbli4
    pbli5
    pbli6
    pbli7
    pbli8
    pcp1
    pcp2
    pcp3
    pcp4
    pcp5
    pcp6
    permission_group_id
    pppd1
    pppd10
    pppd11
    pppd2
    pppd3
    pppd4
    pppd5
    pppd6
    pppd7
    pppd8
    pppd9
    prof_concerns
    sbpic1
    sbpic2
    sbpic3
    sbpic4
    sbpic5
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
    ics6
    ics7
    ics8
    medhub_id
    mk1
    mk2
    mk3
    mk4
    mk5
    mspe
    overall_summ_comm_perf
    pbli1
    pbli2
    pbli3
    pbli4
    pbli5
    pbli6
    pbli7
    pbli8
    pcp1
    pcp2
    pcp3
    pcp4
    pcp5
    pcp6
    permission_group_id
    pppd1
    pppd10
    pppd11
    pppd2
    pppd3
    pppd4
    pppd5
    pppd6
    pppd7
    pppd8
    pppd9
    prof_concerns
    sbpic1
    sbpic2
    sbpic3
    sbpic4
    sbpic5
    start_date
    student_uid
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

  # Overwrite this method to customize how competencies are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(competency)
  #   "Competency ##{competency.id}"
  # end
end
