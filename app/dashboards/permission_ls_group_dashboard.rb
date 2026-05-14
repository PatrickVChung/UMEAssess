require "administrate/base_dashboard"

class PermissionLsGroupDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    enabled: Field::Boolean,
    lime_survey: Field::BelongsTo,
    lime_survey_sid: Field::Number,
    permission_group: Field::BelongsTo,
    permission_ls_group_filters: Field::HasMany,
    role_aggregate: Field::HasOne,
    view_all: Field::Boolean,
    view_raw: Field::Boolean,
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
    enabled
    lime_survey
    lime_survey_sid
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    enabled
    lime_survey
    lime_survey_sid
    permission_group
    permission_ls_group_filters
    role_aggregate
    view_all
    view_raw
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    enabled
    lime_survey
    lime_survey_sid
    permission_group
    permission_ls_group_filters
    role_aggregate
    view_all
    view_raw
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

  # Overwrite this method to customize how permission ls groups are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(permission_ls_group)
  #   "PermissionLsGroup ##{permission_ls_group.id}"
  # end
end
