# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :student
  belongs_to :schedule
  belongs_to :exam

  has_many :mcq_answers, dependent: :destroy
  accepts_nested_attributes_for :mcq_answers, allow_destroy: true, reject_if: :mcq_answer_validator
  has_many :blank_answers, dependent: :destroy
  accepts_nested_attributes_for :blank_answers, allow_destroy: true, reject_if: :blank_answer_validator

  private

  def mcq_answer_validator
    false
  end

  def blank_answer_validator
    false
  end
end
