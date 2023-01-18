module Setter
  extend ActiveSupport::Concern

  module Subject
    include EntityFinder

    def set_subject
      @subject = find_entity('subject', params[:id] || params[:subject_id])
    end
  end
end
