# frozen_string_literal: true

class Teacher < User
  has_many :subjects, dependent: :destroy
  has_many :exams, dependent: :destroy
  has_many :schedules: dependent: :destroy
end
