# frozen_string_literal: true

class ExamsController < ApplicationController
  before_action :set_exam, except: %i[index new create]

  include Setter::ExamSetter

  def index
    @exams = Exam.all.order(:created_at)
    authorize @exams
  end

  def show; end

  def new
    @previous_exam = Exam.where(teacher_id: current_user.id).find_by(status: :uncertain)
    @exam = Exam.new
    authorize @previous_exam
    @subjects = Subject.all
    @exam.mcqs.build
    @exam.blanks.build
  end

  def create
    @exam = Exam.new(exam_params)
    authorize @exam

    if @exam.save
      redirect_to root_path, notice: 'Exam Created (Approval Pending)'
    else
      redirect_to new_exam_path, alert: 'Could not save exam'
    end
  end

  def edit
    authorize @exam, :create?
  end

  def update
    authorize @exam, :create?

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
    params.require(:exam).permit(:teacher_id, :subject_id, :title,
                                 mcqs_attributes: Mcq.attribute_names.map(&:to_sym),
                                 blanks_attributes: Blank.attribute_names.map(&:to_sym))
  end
end
