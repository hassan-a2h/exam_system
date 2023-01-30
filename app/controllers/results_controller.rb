class ResultsController < ApplicationController
  def new
    @result = Result.new
    schedule = Schedule.find(params[:id])
    @exam = Exam.includes(:mcqs, :blanks).find(schedule.exam_id)
  end
end
