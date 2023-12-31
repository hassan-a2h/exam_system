# frozen_string_literal: true

class ResultsController < ApplicationController
  def index
    @results = policy_scope(Result)
    authorize @results
  end

  def show
    @result = Result.includes(:mcq_answers, :blank_answers).find(params[:id])
    @exam = Exam.includes(:mcqs, :blanks).find(@result.exam_id)
    authorize @result
  end

  def create
    @result = Result.new(result_params)
    @schedule = Schedule.find(@result.schedule_id)
    authorize @schedule, :create?, policy_class: ResultPolicy
    @result.obtained_marks = calculate_obtained_marks(@result,
                                                      Exam.find(@result.exam_id))

    if @result.save
      redirect_to @result
    else
      redirect_to attempt_path(@result.schedule_id), alert: 'Must answer all questions'
    end
  end

  private

  def result_params
    params.require(:result).permit(:student_id, :exam_id, :schedule_id, :total_marks,
                                   mcq_answers_attributes: McqAnswer.attribute_names.map(&:to_sym),
                                   blank_answers_attributes: BlankAnswer.attribute_names.map(&:to_sym))
  end

  def calculate_obtained_marks(student_answers, exam)
    @marks = 0

    mcqs_obtained_marks(student_answers, exam)
    blanks_obtained_marks(student_answers, exam)
    @marks
  end

  def mcqs_obtained_marks(student_answers, exam)
    exam&.mcqs&.each_with_index do |mcq, i|
      @marks += mcq.marks if student_answers.mcq_answers[i].answer == mcq.correct_option
    end
  end

  def blanks_obtained_marks(student_answers, exam)
    exam&.blanks&.each_with_index do |blank, i|
      @marks += blank.marks if student_answers.blank_answers[i].answer.casecmp(blank.answer).zero?
    end
  end
end
