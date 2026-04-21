class AdvisorTypesController < ApplicationController
# advisor_types_controller.rb
  def advisors
    @advisors = Advisor.where(advisor_type_id: params[:id]).where.not(name: 'Coach').order(:name)
    render layout: false
  end

  def primary_reasons
    @advisor_type = AdvisorType.find(params[:id])
    render layout: false
  end

end
