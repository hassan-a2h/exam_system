# frozen_string_literal: true

module ExamHelper
  def subjects_list
    Subject.all.map { |subject| [subject.name, subject.id] }
  end

  def subjects_for_teacher
    Subject.find_by(teacher_id: current_user.id)
  end
end
