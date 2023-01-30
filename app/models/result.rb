class Result < ApplicationRecord
  has_many :mcq_answers, dependent: :destroy
  has_many :blank_answers, dependent: :destroy
end
