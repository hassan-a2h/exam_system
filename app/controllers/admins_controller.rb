# frozen_string_literal: true

class AdminsController < ApplicationController
  def index; end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to root_path, notice: 'Admin added'
    else
      render :new
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = User.find(params[:id])

    if @admin.update(admin_params)
      redirect_back_or_to root_path, notice: 'Profile Info Updated'
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
end
