# frozen_string_literal: true

class Blank < ApplicationRecord
  belongs_to :exam, optional: true

  validates :marks, :answer, presence: true
  validate :around_text

  private

  def around_text
    return if text_after.present? || before_after.present?

    errors.add(:base, 'Invalid fill in the blank')
  end
end
