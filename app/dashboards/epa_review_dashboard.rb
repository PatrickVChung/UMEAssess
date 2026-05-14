require "administrate/base_dashboard"

class EpaReviewDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    badge_decision1: Field::String,
    badge_decision2: Field::String,
    epa: Field::String,
    evidence1: Field::Text,
    evidence2: Field::Text,
    general_comments1: Field::Text,
    general_comments2: Field::Text,
    reason1: Field::String,
    reason2: Field::String,
    review_date1: Field::DateTime,
    review_date2: Field::DateTime,
    reviewable: Field::Polymorphic,
    reviewer1: Field::String,
    reviewer2: Field::String,
    student_comments1: Field::String,
    student_comments2: Field::String,
    trust1: Field::String,
    trust2: Field::String,
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
    badge_decision1
    badge_decision2
    epa
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    badge_decision1
    badge_decision2
    epa
    evidence1
    evidence2
    general_comments1
    general_comments2
    reason1
    reason2
    review_date1
    review_date2
    reviewable
    reviewer1
    reviewer2
    student_comments1
    student_comments2
    trust1
    trust2
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    badge_decision1
    badge_decision2
    epa
    evidence1
    evidence2
    general_comments1
    general_comments2
    reason1
    reason2
    review_date1
    review_date2
    reviewable
    reviewer1
    reviewer2
    student_comments1
    student_comments2
    trust1
    trust2
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

  # Overwrite this method to customize how epa reviews are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(epa_review)
  #   "EpaReview ##{epa_review.id}"
  # end
end
