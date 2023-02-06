# frozen_string_literal: true

module ScheduleHelper
  def convert_to_local_time(time)
    time.change(offset: '+0500')
  end

  def exams_list
    Exam.by_teacher(current_user.id).all.map { |exam| [exam.title, exam.id] }
  end
end
