class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  belongs_to :permission_group, inverse_of: :users

  normalizes :email, with: ->(e) { e.strip.downcase }

  has_many :artifacts, dependent: :destroy
  has_many :fom_exams, dependent: :destroy, inverse_of: :user
  has_many :med22_fom_exams, dependent: :destroy
  has_many :med21_fom_exams, dependent: :destroy
  has_many :fom_labels
  has_many :formative_feedbacks, dependent: :destroy
  has_one  :ume_bls, dependent: :destroy
  has_many :epa_masters, dependent: :destroy, inverse_of: :user
  # serialize :roles, type: Array
  has_many :epas, dependent: :destroy
  has_many :competencies, dependent: :destroy, inverse_of: :user
  has_many :new_competencies, dependent: :destroy, inverse_of: :user

  has_many :preceptor_evals, dependent: :destroy
  has_many :preceptor_assesses, dependent: :destroy

  has_many :new_competencies, dependent: :destroy, inverse_of: :user
  has_many :meetings, inverse_of: :user, dependent: :destroy

  ROLES = {
    # can view assignments that they belong to
    participant: 0,
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
   'dean' => 30,
   'coach' => 20,
   'student' => 10
 }.freeze

 COACHING_ROLES.each do |role_name, importance_value|
   # Define: dean?, coach?, student?
   define_method("#{role_name}?") do
     coaching_type == role_name
   end

   # Define: dean_or_higher?, etc.
   define_method("#{role_name}_or_higher?") do
     # 1. Use the boolean check instead of the "or_higher" check to avoid recursion
     return true if respond_to?(:admin?) && admin?

     # 2. Safely fetch the current user's rank
     current_rank = COACHING_ROLES[coaching_type] || 0
     current_rank >= importance_value
   end
 end

 def current_user
   return Current.user
 end

  def display_name
    last, first = full_name.split(", ").map(&:strip)
    return "#{first} #{last}"
  end
end
