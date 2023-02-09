# frozen_string_literal: true

class AttemptsController < ApplicationController
  before_action :set_result
  before_action :check_previous_result

  def show
    @exam = Exam.includes(:mcqs, :blanks).find(@schedule.exam_id)
    @result.mcq_answers.build
    @result.blank_answers.build
  end

  private

  def set_result
    @result = Result.new
    @schedule = Schedule.includes(:exam).find(params[:id])
  end

  def check_previous_result
    @previous_result = current_user.results.find_by(schedule_id: @schedule.id)
    redirect_to result_path(@previous_result) if @previous_result
    authorize @previous_result, :show?, policy_class: AttemptPolicy
  end
end
