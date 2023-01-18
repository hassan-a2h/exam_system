# frozen_string_literal: true

class StudentsController < ApplicationController
  def index; end

  def show; end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = User.find(params[:id])

    if @student.update(student_params)
      redirect_back_or_to root_path, notice: 'Profile Info Updated'
    else
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation, :type)
  end
end
