# frozen_string_literal: true

class Admin < User
  has_many :subjects, dependent: :nullify
end
