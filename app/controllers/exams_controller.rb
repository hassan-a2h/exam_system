# frozen_string_literal: true

class ExamsController < ApplicationController
  include Setter::ExamSetter

  before_action :set_exam, except: %i[index new create]

  def index
    @exams = policy_scope(Exam)
    authorize @exams
  end

  def show
    authorize @exam
  end

  def new
    @previous_exam = Exam.find_by(teacher_id: current_user.id, status: :uncertain) || 'empty'
    @exam = Exam.new
    authorize @previous_exam, :new?, policy_class: ExamPolicy
    @exam.mcqs.build
    @exam.blanks.build
  end

  def create
    @exam = Exam.new(exam_params)
    @subject = @exam.subject
    authorize @subject, policy_class: ExamPolicy

    if @exam.save
      redirect_to exams_path, notice: 'Exam Created (Approval Pending)'
    else
      render :new
    end
  end

  def edit
    authorize @exam

    @schedule = Schedule.find_by(exam_id: @exam)
    return unless @schedule.present? && @schedule.end_time > DateTime.now

    redirect_to exams_path, alert: 'Can not edit scheduled exam'
  end

  def update
    authorize @exam

    if @exam.update(exam_params)
      redirect_to exams_path, notice: 'Exam updated'
    else
      redirect_to exams_path, alert: 'Error! could not update'
    end
  end

  def destroy
    authorize @exam

    if @exam.destroy
      redirect_to exams_path, notice: 'Exam removed'
    else
      redirect_to exams_path, alert: 'Error! could not remove'
    end
  end

  private

  def exam_params
    params.require(:exam).permit(:teacher_id, :subject_id, :title, :status,
                                 mcqs_attributes: Mcq.attribute_names.map(&:to_sym).push(:_destroy),
                                 blanks_attributes: Blank.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
