# frozen_string_literal: true

class BlanksController < ApplicationController
  include Question

  def destroy
    @blank = Blank.find(params[:id])
    exam = Exam.find(@blank.exam_id)

    if total_questions(exam) == 1
      redirect_to edit_exam_path(exam), alert: 'Exam needs to have at least one question' && return
    end

    exam.marks -= @blank.marks
    exam.save

    if @blank.destroy
      redirect_to edit_exam_path(exam), notice: 'Fill in the blank removed'
    else
      redirect_to root_path, alert: 'Could not remove FITB'
    end
  end
end
