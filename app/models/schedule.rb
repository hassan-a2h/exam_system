class Schedule < ApplicationRecord
  belongs_to :teacher
  belongs_to :exam

  validates :teacher_id, :exam_id, :start_time, :end_time, presence: true

  enum status: {
    uncertain: 0,
    approved: 10,
    rejected: 20
  }
end
