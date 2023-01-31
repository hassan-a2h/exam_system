# frozen_string_literal: true

class Student < User
  has_many :results, dependent: :nullify
end
