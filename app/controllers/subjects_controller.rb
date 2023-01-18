class SubjectsController < ApplicationController
  before_action :set_subject, except: [:index, :new, :create]

  include Setter::Subject

  def index
    @subjects = Subject.all.includes(:teacher, :admin).order(:created_at)
    authorize @subjects
  end

  def show
    authorize @subject, :index?
  end

  def new
    @subject = Subject.new
    authorize @subject, :index?
    @teachers = Teacher.all
  end

  def create
    @subject = Subject.new(subject_params)
    authorize @subject, :index?

    if @subject.save
      redirect_to root_path, notice: 'Subject Added'
    else
      render :new
    end
  end

  def edit
    authorize @subject, :index?
    @teachers = Teacher.all
  end

  def update
    authorize @subject, :index?

    if @subject.update(subject_params)
      redirect_to root_path, notice: 'Subject updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @subject, :index?

    if @subject.destroy
      redirect_to root_path, notice: 'Subject deleted'
    else
      redirect_to root_path, alert: 'Error! could not delete subject'
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:admin_id, :teacher_id, :name)
  end
end
