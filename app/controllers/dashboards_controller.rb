class DashboardsController < ApplicationController
  def show
    case current_user&.type
    when 'Admin'
      redirect_to admin_path(current_user)
    when 'Teacher'
      redirect_to teacher_path(current_user)
    when 'Student'
      redirect_to student_path(current_user)
    end
  end
end
