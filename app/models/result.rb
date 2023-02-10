# frozen_string_literal: true

class Result < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :student
  belongs_to :schedule
  belongs_to :exam
  has_many :mcq_answers, dependent: :destroy
  has_many :blank_answers, dependent: :destroy
  accepts_nested_attributes_for :mcq_answers, allow_destroy: true
  accepts_nested_attributes_for :blank_answers, allow_destroy: true
end
