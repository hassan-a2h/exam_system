# frozen_string_literal: true

class AttemptsController < ApplicationController
  def show
    @result = Result.new
    authorize @result, :show?, policy_class: AttemptPolicy
    @schedule = Schedule.includes(:exam).find(params[:id])

    @previous_result = Result.find_by(student_id: current_user.id, schedule_id: @schedule.id)
    redirect_to result_path(@previous_result) if @previous_result

    @exam = Exam.includes(:mcqs, :blanks).find(@schedule.exam_id)
    @result.mcq_answers.build
    @result.blank_answers.build
  end
end
