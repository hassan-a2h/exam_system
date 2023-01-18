# frozen_string_literal: true

class TeachersController < ApplicationController
  def index; end

  def show; end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = User.find(params[:id])

    if @teacher.update(teacher_params)
      redirect_back_or_to root_path, notice: 'Profile Info Updated'
    else
      render :edit
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :password_confirmation, :type)
  end
end
