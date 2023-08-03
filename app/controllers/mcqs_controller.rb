# frozen_string_literal: true

class McqsController < ApplicationController
  before_action :check_empty_exam

  include Question

  def destroy
    if @record.destroy
      redirect_to edit_exam_path(@exam), notice: 'Mcq removed'
    else
      redirect_to root_path, alert: 'Could not remove Mcq'
    end
  end

  private

  def check_empty_exam
    return unless check_last_question('mcq', params[:id])

    redirect_to edit_exam_path(@exam), alert: 'Exam needs to have at least one question'
  end
end
