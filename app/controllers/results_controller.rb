# frozen_string_literal: true

class ResultsController < ApplicationController
  def index
    @results = policy_scope(Result)
    authorize @results
  end

  def new
    @result = Result.new
    schedule = Schedule.find(params[:id])
    @exam = Exam.includes(:mcqs, :blanks).find(schedule.exam_id)
  end

  def create
    @result = Result.new(result_params)
    @result.obtained_marks = calculate_obtained_marks(@result,
                                                      Exam.find(@result.exam_id))

    if @result.save
      redirect_to @result
    else
      redirect_to root_path, alert: 'Could not save result'
    end
  end

  def show
    @result = Result.includes(:mcq_answers, :blank_answers).find(params[:id])
    @exam = Exam.includes(:mcqs, :blanks).find(@result.exam_id)
  end

  private

  def result_params
    params.require(:result).permit(:student_id, :exam_id, :schedule_id, :total_marks,
                                   mcq_answers_attributes: McqAnswer.attribute_names.map(&:to_sym),
                                   blank_answers_attributes: BlankAnswer.attribute_names.map(&:to_sym))
  end

  def calculate_obtained_marks(student_answers, exam)
    @marks = 0
    counter = exam.mcqs.count

    (0...counter).each do |i|
      @marks += exam.mcqs[i].marks if student_answers.mcq_answers[i].answer == exam.mcqs[i].correct_option
    end

    counter = exam.blanks.count
    (0...counter).each do |i|
      @marks += exam.blanks[i].marks if student_answers.blank_answers[i].answer.casecmp(exam.blanks[i].answer).zero?
    end

    @marks
  end
end
