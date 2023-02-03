# frozen_string_literal: true

class McqsController < ApplicationController
  include Question

  def destroy
    @mcq = Mcq.find(params[:id])
    exam = Exam.find(@mcq.exam_id)

    if total_questions(exam) == 1
      redirect_to edit_exam_path(exam), alert: 'Exam needs to have at least one question' && return
    end

    exam.marks -= @mcq.marks
    exam.save

    if @mcq.destroy
      redirect_to edit_exam_path(exam), notice: 'Mcq removed'
    else
      redirect_to root_path, alert: 'Could not remove Mcq'
    end
  end
end
