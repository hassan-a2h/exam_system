# frozen_string_literal: true

module ExamHelper
  def subjects_list
    Subject.where(teacher_id: current_user.id).map { |subject| [subject.name, subject.id] }
  end

  def subjects_for_teacher
    Subject.find_by(teacher_id: current_user.id)
  end
end
