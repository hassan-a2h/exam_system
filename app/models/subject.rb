class Subject < ApplicationRecord
  belongs_to :admin
  belongs_to :teacher

  has_many :exams, dependent: :destroy

  validates :name, :admin_id, :teacher_id, presence: true
end
