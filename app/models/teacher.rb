# frozen_string_literal: true

class Teacher < User
  has_many :subjects, dependent: :destroy
end
