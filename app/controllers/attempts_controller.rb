class AttemptsController < ApplicationController
  def show
    @result = Result.new
    schedule = Schedule.find(params[:id])
    @result.exam_id = schedule.exam_id
    @result.schedule_id = schedule.id
    @exam = Exam.includes(:mcqs, :blanks).find(schedule.exam_id)
    @result.mcq_answers.build
    @result.blank_answers.build
  end
end
