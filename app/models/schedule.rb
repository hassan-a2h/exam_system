class Schedule < ApplicationRecord
  default_scope { order(:created_at) }

  belongs_to :teacher
  belongs_to :exam

  validates :teacher_id, :exam_id, :start_time, :end_time, presence: true
  validate :start_and_end_time

  enum status: {
    pending: 0,
    approved: 10,
    rejected: 20
  }

  scope :by_teacher, ->(user_id) { where("teacher_id = ?", user_id) }
  scope :active_exams, -> { where("end_time > ? AND status = ?", DateTime.now, 10) }

  private

  def start_and_end_time
    current_time = DateTime.now
    if start_time < current_time
      errors.add(:start_time, 'start time can not be in past')
    elsif end_time < current_time
      errors.add(:start_time, 'end time can not be in past')
    elsif start_time > end_time
      errors.add(:start_time, 'end time can\'t be before start time')
    end
  end
end
