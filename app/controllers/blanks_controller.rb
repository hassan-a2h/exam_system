# frozen_string_literal: true

class BlanksController < ApplicationController
  before_action :check_empty_exam, only: :destroy

  def destroy
    if @blank.destroy
      redirect_to edit_exam_path(@exam), notice: 'Fill in the blank removed'
    else
      redirect_to root_path, alert: 'Could not remove FITB'
    end
  end

  private

  def check_empty_exam
    @blank = Blank.find(params[:id])
    @exam = Exam.find(@blank.exam_id)

    return unless total_questions(@exam) == 1

    redirect_to edit_exam_path(@exam), alert: 'Exam needs to have at least one question'
  end
end
