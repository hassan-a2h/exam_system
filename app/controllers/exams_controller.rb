class ExamsController < ApplicationController
  before_action :set_exam, except: [:index, :new, :create]

  include Setter

  def index
    @exams = Exam.all.order(:created_at)
    authorize @exams
  end

  def show
  end

  def new
    @exam = Exam.new
    authorize @exam
    @subjects = Subject.all
  end

  def create
    @exam = Exam.new(exam_params)
    authorize @exam, :new?

    if @exam.save
      redirect_to root_path, notice: 'Exam Created (Approval Pending)'
    else
      render :new
    end
  end

  def edit
    authorize @exam, :new?
  end

  def update
    authorize @exam, :new?

    if @exam.update(exam_params)
      redirect_to root_path, notice: 'Exam updated'
    else
      redirect_to root_path, alert: 'Error! could not update'
    end
  end

  def destroy
    authorize @exam, :index?

    if @exam.destroy
      redirect_to root_path, notice: 'Exam removed'
    else
      redirect_to root_path, alert: 'Error! could not remove'
    end
  end

  private

  def exam_params
    params.require(:exam).permit(:title, :marks, :teacher_id, :subject_id, :start_time, :end_time)
  end
end
