# frozen_string_literal: true

class Ability
  include CanCan::Ability


  def initialize(user)
    user ||= User.new                   # guest user (not logged in)

    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :create, :update, :destroy, to: :alter
    alias_action :read, :update, to: :modify

    all_users_permissions user
    # Normal admin function
    if user.admin_or_higher?
      admin_users_permissions user
    else
      other_users_permissions user
    end
    if ["coach", "student", "dean"].include? user.coaching_type
      self.send("#{user.coaching_type}_permissions", user)
    end
  end
  def admin_users_permissions user
    can :read, :all
    can :access, :rails_admin
    can :update, User do |user|
      !(user.admin? || user.superadmin?)
    end

    if user.superadmin?
      # Super powers!!
      can :debug, :dashboard
      can :manage, :all
      can :read, :lime_survey_website
      cannot :import, :all
      can :import, [Med26Mspe]
    end
  end

  # Non Admin users
  def other_users_permissions user
    can :update, User, id: user.id
    can :read, User, id: user.id
  end
  def student_permissions user
    can :read, Student
    can :create, Coaching::Goal
    can :create, Coaching::Meeting
    can :modify, Coaching::Goal do |goal|
      goal.user == user
    end
    can :modify, Coaching::Meeting do |m|
      m.user == user
    end
    cannot :read, EpaMaster
    cannot :read, EgCohort
    cannot :read, EpaReview
    cannot [:index, :competency, :mspe, :download_file], ReportsController
  end

  def coach_permissions user
    can :read, Student
    can :create, Coaching::Goal
    can :create, Coaching::Meeting
    can :modify, Coaching::Goal do |goal|
      user.cohorts.include? goal.user.cohort
    end
    can :modify, Coaching::Meeting do |m|
      user.cohorts.include? m.user.cohort
    end
  end

  def dean_permissions user
    can :read, Student
    can :read, Coaching::Goal
    can :read, Coaching::Meeting
  end

  def admin_permissions user
    can :manage, :all
  end
end
