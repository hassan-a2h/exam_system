# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.where('id != ?', current_user.id).order(:created_at)
    authorize @users
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: 'Profile Updated'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user, :index?, policy_class: UserPolicy

    if @user.destroy
      redirect_to users_path, notice: 'User Removed'
    else
      redirect_to users_path, alert: 'Error! could not remove user'
    end
  end

  private

  def user_params
    params.require(:student).permit(:picture)
  end
end
