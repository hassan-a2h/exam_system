# frozen_string_literal: true

class BlankAnswer < ApplicationRecord
  belongs_to :result, optional: true
  belongs_to :blank
end
