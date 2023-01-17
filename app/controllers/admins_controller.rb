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

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
end
