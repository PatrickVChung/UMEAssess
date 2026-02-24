class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  belongs_to :permission_group, inverse_of: :users

  normalizes :email, with: ->(e) { e.strip.downcase }

  has_many :artifacts, dependent: :destroy
  # serialize :roles, type: Array

  ROLES = {
    # can view assignments that they belong to
    participant: 0,

    # Piecemeal permissions
    # Commented these roles out on 11/18/2024
    can_dashboard: 1,
    # can_stats: 1,
    # can_reports: 1,
    # can_chart: 1,
    can_lime: 1,
    can_lime_all: 1,
    can_view_spreadsheet: 1,
    # Commented these roles out on 11/18/2024
    #can_create_assignment_group: 1,
    can_process_course_catalog: 1,
    can_process_fom: 1,
    can_process_eg_assignment: 1,

    # Role permissions
    admin: 25,
    superadmin: 50 }

    ROLES.keys.each do |role_key|
      # Convert to string once to avoid repeated conversions
      role_name = role_key.to_s

      define_method("#{role_name}?") do
        # Ensure we compare strings to strings
        roles&.include?(role_name)
      end
    end

 def roles_enum
   ROLES.keys
 end

 COACHING_ROLES = {
   'dean': 30,
   'coach': 20,
   'student': 10
 }

 # define "#{role}?" style getters for coaching system
 COACHING_ROLES.each do |role, val|
   define_method("#{role.to_s}?") do
     coaching_type == role.to_s
   end

   define_method("#{role.to_s}_or_higher?") do
     return true if admin_or_higher?
     COACHING_ROLES[coaching_type.to_sym] >= val
   end
 end


  def display_name
    last, first = full_name.split(", ").map(&:strip)
    return "#{first} #{last}"
  end
end
