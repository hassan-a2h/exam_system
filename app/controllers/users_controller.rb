# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all.order(:created_at)
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to root_path, notice: 'User Removed'
    else
      redirect_to root_path, alert: 'Error! could not remove user'
    end
  end
end
