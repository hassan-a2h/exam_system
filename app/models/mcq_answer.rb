# frozen_string_literal: true

class McqAnswer < ApplicationRecord
  belongs_to :result, optional: true
  belongs_to :mcq

  validates :answer, presence: true
end
