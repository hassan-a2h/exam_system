# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all.order(:created_at)
    authorize @users
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user, :index

    if @user.destroy
      redirect_to root_path, notice: 'User Removed'
    else
      redirect_to root_path, alert: 'Error! could not remove user'
    end
  end
end
