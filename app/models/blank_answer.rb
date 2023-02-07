# frozen_string_literal: true

class BlankAnswer < ApplicationRecord
  belongs_to :blank
  belongs_to :result, optional: true

  validates :answer, presence: true
end
