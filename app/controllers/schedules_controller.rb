class SchedulesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @schdeule = Schedule.new
    # Add policy for authorization
    authorize @schedule
    # Add scope in Subject model
    @subjects = Subject.by_teacher(current_user.id)
  end

  def create
  end

  def edit
  end

  def update; end

  def destroy; end
end
