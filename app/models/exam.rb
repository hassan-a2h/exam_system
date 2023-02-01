# frozen_string_literal: true

class Exam < ApplicationRecord
  default_scope { order(:created_at) }

  before_save :calculate_total_marks

  belongs_to :teacher
  belongs_to :subject
  has_many :schedules, dependent: :destroy
  has_many :results, dependent: :destroy

  has_many :mcqs, dependent: :destroy
  accepts_nested_attributes_for :mcqs, allow_destroy: true, reject_if: :check_mcqs
  has_many :blanks, dependent: :destroy
  accepts_nested_attributes_for :blanks, allow_destroy: true, reject_if: :check_blanks

  validates :title, presence: true
  validate :associated_attributes

  enum status: {
    uncertain: 0,
    rejected: 1,
    approved: 2
  }

  scope :by_teacher, ->(user_id) { where('teacher_id = ?', user_id) }

  private

  def check_blanks
    false
  end

  def check_mcqs
    false
  end

  def calculate_total_marks
    self.marks = 0
    mcqs.each do |mcq|
      self.marks += mcq.marks
    end

    blanks.each do |blank|
      self.marks += blank.marks
    end
  end

  def associated_attributes
    return unless mcqs.blank? && blanks.blank?

    errors.add(:base, 'An exam needs to have at least one question')
  end
end
