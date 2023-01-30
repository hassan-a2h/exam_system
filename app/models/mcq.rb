# frozen_string_literal: true

class Mcq < ApplicationRecord
  belongs_to :exam, optional: true
  has_many :mcq_answers, dependent: :destroy

  validates :marks, :question, :correct_option, :option1, :option2, :option3, :option4, presence: true
end
