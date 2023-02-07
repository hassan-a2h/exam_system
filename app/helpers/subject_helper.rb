# frozen_string_literal: true

module SubjectHelper
  def set_teachers
    Teacher.all.map { |teacher| [teacher.name, teacher.id] }
  end
end
