# frozen_string_literal: true

class McqAnswer < ApplicationRecord
  belongs_to :mcq
  belongs_to :result, optional: true

  validates :answer, presence: true
end
