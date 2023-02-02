# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all.order(:created_at)
    authorize @users
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)

    if @user.update(user_params)
      redirect_to root_path, notice: 'Profile Updated'
    else
      redirect_to root_path, alert: 'Error! could not update profile'
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user, :index?, policy_class: UserPolicy

    if @user.destroy
      redirect_to root_path, notice: 'User Removed'
    else
      redirect_to root_path, alert: 'Error! could not remove user'
    end
  end

  private

  def user_params
    params.require(:student).permit(:picture)
  end
end
