# frozen_string_literal: true

class SchedulesController < ApplicationController
  include Setter::ScheduleSetter

  before_action :set_schedule, only: %i[destroy accept reject]

  def index
    @schedules = policy_scope(Schedule)
    authorize @schedules
  end

  def new
    @schedule = Schedule.new
    @exams = Exam.by_teacher(current_user.id)
    authorize @exams, :new?, policy_class: SchedulePolicy
  end

  def create
    @schedule = Schedule.new(schedule_params)
    authorize @schedule, :new?

    if @schedule.save
      redirect_to root_path, notice: 'Exam Scheduled (Approval Pending)'
    else
      redirect_to new_schedule_path, notice: 'Could not save exam'
    end
  end

  def destroy
    authorize @schedule

    if @schedule.destroy
      redirect_to root_path, notice: 'Schedule Removed'
    else
      redirect_to root_path, alert: 'Coul not remove Schedule'
    end
  end

  def accept
    authorize @schedule

    if @schedule.approved!
      redirect_to schedules_path, notice: 'Schedule Approved'
    else
      redirect_to schedules_path, alert: 'Could not approve Schedule'
    end
  end

  def reject
    authorize @schedule, :accept?

    if @schedule.rejected!
      redirect_to schedules_path, notice: 'Schedule disapproved'
    else
      redirect_to schedules_path, alert: 'Could not reject Schedule'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(Schedule.attribute_names.map(&:to_sym))
  end
end
