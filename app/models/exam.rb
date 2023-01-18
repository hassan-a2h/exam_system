class Exam < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject

  validates :title, :marks, :teacher_id, :subject_id, :start_time, :end_time, presence: true

  enum status: {
    uncertain: 0,
    approved: 1
  }
end
