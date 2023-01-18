module Setter
  extend ActiveSupport::Concern

  module Subject
    include EntityFinder

    def set_subject
      @subject = find_entity('subject', params[:id] || params[:subject_id])
    end
  end

  module Subject
    include EntityFinder

    def set_exam
      @exam = find_entity('exam', params[:id] || params[:exam_id])
    end
  end
end
