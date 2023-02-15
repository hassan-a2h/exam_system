# frozen_string_literal: true

class SubjectsController < ApplicationController
  before_action :set_subject, except: %i[index new create]

  include Setter::SubjectSetter

  def index
    @subjects = Subject.all.includes(:teacher, :admin).order(:created_at)
    authorize @subjects
  end

  def show
    authorize @subject, :index?
  end

  def new
    @subject = Subject.new
    authorize @teachers, :new?, policy_class: SubjectPolicy
  end

  def create
    @subject = Subject.new(subject_params)
    authorize @subject, :index?

    if @subject.save
      redirect_to admin_subjects_path(current_user), notice: 'Subject Added'
    else
      render :new
    end
  end

  def edit
    authorize @subject, :index?
  end

  def update
    authorize @subject, :index?

    if @subject.update(subject_params)
      redirect_to admin_subjects_path(current_user), notice: 'Subject updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @subject, :index?

    if @subject.destroy
      redirect_to admin_subjects_path(current_user), notice: 'Subject deleted'
    else
      redirect_to admin_subjects_path(current_user), alert: 'Error! could not delete subject'
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:admin_id, :teacher_id, :name)
  end
end
