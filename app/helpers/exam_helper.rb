# frozen_string_literal: true

module ExamHelper
  def subjects_list
    Subject.all.map { |subject| [subject.name, subject.id] }
  end
end
