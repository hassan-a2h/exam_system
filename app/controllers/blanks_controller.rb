# frozen_string_literal: true

class BlanksController < ApplicationController
  before_action :check_empty_exam, only: :destroy

  include Question

  def destroy
    if @record.destroy
      redirect_to edit_exam_path(@exam), notice: 'Fill in the blank removed'
    else
      redirect_to root_path, alert: 'Could not remove FITB'
    end
  end

  private

  def check_empty_exam
    return unless check_last_question('blank', params[:id])

    redirect_to edit_exam_path(@exam), alert: 'Exam needs to have at least one question'
  end
end
