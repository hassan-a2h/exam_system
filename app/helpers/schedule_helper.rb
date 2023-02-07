# frozen_string_literal: true

module ScheduleHelper
  def convert_to_local_time(time)
    time.change(offset: '+0500')
  end

  def exams_list
    Exam.by_teacher(current_user.id).where(status: :approved).map { |exam| [exam.title, exam.id] }
  end

  def exam_time_passed_status(schedule)
    if DateTime.now > schedule.end_time
      'Conducted'
    elsif DateTime.now < schedule.start_time
      'Scheduled'
    else
      'Taking Place'
    end
  end
end
