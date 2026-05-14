require "administrate/base_dashboard"

class FomExamDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    comp1_dropped_quiz: Field::String,
    comp1_dropped_score: Field::String.with_options(searchable: false),
    comp1_wk1: Field::String.with_options(searchable: false),
    comp1_wk10: Field::String.with_options(searchable: false),
    comp1_wk11: Field::String.with_options(searchable: false),
    comp1_wk12: Field::String.with_options(searchable: false),
    comp1_wk2: Field::String.with_options(searchable: false),
    comp1_wk3: Field::String.with_options(searchable: false),
    comp1_wk4: Field::String.with_options(searchable: false),
    comp1_wk5: Field::String.with_options(searchable: false),
    comp1_wk6: Field::String.with_options(searchable: false),
    comp1_wk7: Field::String.with_options(searchable: false),
    comp1_wk8: Field::String.with_options(searchable: false),
    comp1_wk9: Field::String.with_options(searchable: false),
    comp2a_hss1: Field::String.with_options(searchable: false),
    comp2a_hss10: Field::String.with_options(searchable: false),
    comp2a_hss11: Field::String.with_options(searchable: false),
    comp2a_hss12: Field::String.with_options(searchable: false),
    comp2a_hss13: Field::String.with_options(searchable: false),
    comp2a_hss14: Field::String.with_options(searchable: false),
    comp2a_hss15: Field::String.with_options(searchable: false),
    comp2a_hss16: Field::String.with_options(searchable: false),
    comp2a_hss17: Field::String.with_options(searchable: false),
    comp2a_hss18: Field::String.with_options(searchable: false),
    comp2a_hss19: Field::String.with_options(searchable: false),
    comp2a_hss2: Field::String.with_options(searchable: false),
    comp2a_hss20: Field::String.with_options(searchable: false),
    comp2a_hss21: Field::String.with_options(searchable: false),
    comp2a_hss3: Field::String.with_options(searchable: false),
    comp2a_hss4: Field::String.with_options(searchable: false),
    comp2a_hss5: Field::String.with_options(searchable: false),
    comp2a_hss6: Field::String.with_options(searchable: false),
    comp2a_hss7: Field::String.with_options(searchable: false),
    comp2a_hss8: Field::String.with_options(searchable: false),
    comp2a_hss9: Field::String.with_options(searchable: false),
    comp2a_hssavg: Field::String.with_options(searchable: false),
    comp2b_bss1: Field::String.with_options(searchable: false),
    comp2b_bss10: Field::String.with_options(searchable: false),
    comp2b_bss11: Field::String.with_options(searchable: false),
    comp2b_bss12: Field::String.with_options(searchable: false),
    comp2b_bss2: Field::String.with_options(searchable: false),
    comp2b_bss3: Field::String.with_options(searchable: false),
    comp2b_bss4: Field::String.with_options(searchable: false),
    comp2b_bss5: Field::String.with_options(searchable: false),
    comp2b_bss6: Field::String.with_options(searchable: false),
    comp2b_bss7: Field::String.with_options(searchable: false),
    comp2b_bss8: Field::String.with_options(searchable: false),
    comp2b_bss9: Field::String.with_options(searchable: false),
    comp2b_bssavg: Field::String.with_options(searchable: false),
    comp3_final1: Field::String.with_options(searchable: false),
    comp3_final2: Field::String.with_options(searchable: false),
    comp3_final3: Field::String.with_options(searchable: false),
    comp4_nbme: Field::String.with_options(searchable: false),
    comp5a_hss1: Field::String.with_options(searchable: false),
    comp5a_hss2: Field::String.with_options(searchable: false),
    comp5a_hss3: Field::String.with_options(searchable: false),
    comp5a_hssavg: Field::String.with_options(searchable: false),
    comp5b_bss1: Field::String.with_options(searchable: false),
    comp5b_bss2: Field::String.with_options(searchable: false),
    comp5b_bss3: Field::String.with_options(searchable: false),
    comp5b_bss4: Field::String.with_options(searchable: false),
    comp5b_bss5: Field::String.with_options(searchable: false),
    comp5b_bssavg: Field::String.with_options(searchable: false),
    course_code: Field::String,
    course_end_date: Field::Date,
    permission_group_id: Field::Number,
    submit_date: Field::DateTime,
    summary_comp1: Field::String.with_options(searchable: false),
    summary_comp2a: Field::String.with_options(searchable: false),
    summary_comp2b: Field::String.with_options(searchable: false),
    summary_comp3: Field::String.with_options(searchable: false),
    summary_comp4: Field::String.with_options(searchable: false),
    summary_comp5a: Field::String.with_options(searchable: false),
    summary_comp5b: Field::String.with_options(searchable: false),
    user: Field::BelongsTo,
    user_only_fetch_email: Field::BelongsTo,
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
    comp1_dropped_quiz
    comp1_dropped_score
    comp1_wk1
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    comp1_dropped_quiz
    comp1_dropped_score
    comp1_wk1
    comp1_wk10
    comp1_wk11
    comp1_wk12
    comp1_wk2
    comp1_wk3
    comp1_wk4
    comp1_wk5
    comp1_wk6
    comp1_wk7
    comp1_wk8
    comp1_wk9
    comp2a_hss1
    comp2a_hss10
    comp2a_hss11
    comp2a_hss12
    comp2a_hss13
    comp2a_hss14
    comp2a_hss15
    comp2a_hss16
    comp2a_hss17
    comp2a_hss18
    comp2a_hss19
    comp2a_hss2
    comp2a_hss20
    comp2a_hss21
    comp2a_hss3
    comp2a_hss4
    comp2a_hss5
    comp2a_hss6
    comp2a_hss7
    comp2a_hss8
    comp2a_hss9
    comp2a_hssavg
    comp2b_bss1
    comp2b_bss10
    comp2b_bss11
    comp2b_bss12
    comp2b_bss2
    comp2b_bss3
    comp2b_bss4
    comp2b_bss5
    comp2b_bss6
    comp2b_bss7
    comp2b_bss8
    comp2b_bss9
    comp2b_bssavg
    comp3_final1
    comp3_final2
    comp3_final3
    comp4_nbme
    comp5a_hss1
    comp5a_hss2
    comp5a_hss3
    comp5a_hssavg
    comp5b_bss1
    comp5b_bss2
    comp5b_bss3
    comp5b_bss4
    comp5b_bss5
    comp5b_bssavg
    course_code
    course_end_date
    permission_group_id
    submit_date
    summary_comp1
    summary_comp2a
    summary_comp2b
    summary_comp3
    summary_comp4
    summary_comp5a
    summary_comp5b
    user
    user_only_fetch_email
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    comp1_dropped_quiz
    comp1_dropped_score
    comp1_wk1
    comp1_wk10
    comp1_wk11
    comp1_wk12
    comp1_wk2
    comp1_wk3
    comp1_wk4
    comp1_wk5
    comp1_wk6
    comp1_wk7
    comp1_wk8
    comp1_wk9
    comp2a_hss1
    comp2a_hss10
    comp2a_hss11
    comp2a_hss12
    comp2a_hss13
    comp2a_hss14
    comp2a_hss15
    comp2a_hss16
    comp2a_hss17
    comp2a_hss18
    comp2a_hss19
    comp2a_hss2
    comp2a_hss20
    comp2a_hss21
    comp2a_hss3
    comp2a_hss4
    comp2a_hss5
    comp2a_hss6
    comp2a_hss7
    comp2a_hss8
    comp2a_hss9
    comp2a_hssavg
    comp2b_bss1
    comp2b_bss10
    comp2b_bss11
    comp2b_bss12
    comp2b_bss2
    comp2b_bss3
    comp2b_bss4
    comp2b_bss5
    comp2b_bss6
    comp2b_bss7
    comp2b_bss8
    comp2b_bss9
    comp2b_bssavg
    comp3_final1
    comp3_final2
    comp3_final3
    comp4_nbme
    comp5a_hss1
    comp5a_hss2
    comp5a_hss3
    comp5a_hssavg
    comp5b_bss1
    comp5b_bss2
    comp5b_bss3
    comp5b_bss4
    comp5b_bss5
    comp5b_bssavg
    course_code
    course_end_date
    permission_group_id
    submit_date
    summary_comp1
    summary_comp2a
    summary_comp2b
    summary_comp3
    summary_comp4
    summary_comp5a
    summary_comp5b
    user
    user_only_fetch_email
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

  # Overwrite this method to customize how fom exams are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(fom_exam)
  #   "FomExam ##{fom_exam.id}"
  # end
end
