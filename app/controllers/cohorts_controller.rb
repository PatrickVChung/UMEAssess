class CohortsController < ApplicationController
  def students
    cohort = PermissionGroup.find(params[:cohort_id])
    students = cohort.users.select(:id, :full_name).order(:full_name)
    render json: students
  end
end
