# frozen_string_literal: true

class SchedulesController < ApplicationController
  include Setter::ScheduleSetter

  before_action :set_schedule, only: %i[destroy update]
  before_action :set_permission, only: :destroy

  def index
    @schedules = policy_scope(Schedule)
    authorize @schedules
  end

  def new
    @schedule = Schedule.new
    authorize @schedule
  end

  def create
    @schedule = Schedule.new(schedule_params)
    authorize @schedule, :new?

    if @schedule.save
      redirect_to root_path, notice: 'Exam Scheduled (Approval Pending)'
    else
      render :new
    end
  end

  def update
    authorize @schedule
    if @schedule.update(schedule_params)
      redirect_to schedules_path, notice: 'Schedule Updated'
    else
      redirect_to schedules_path, alert: 'Could not approve Schedule'
    end
  end

  def destroy
    if @schedule.destroy
      redirect_to root_path, notice: 'Schedule Removed'
    else
      redirect_to root_path, alert: 'Coul not remove Schedule'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(Schedule.attribute_names.map(&:to_sym))
  end

  def set_permission
    authorize @schedule
  end
end
