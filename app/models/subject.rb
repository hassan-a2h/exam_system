class Subject < ApplicationRecord
  belongs_to :admin
  belongs_to :teacher

  validates :name, :admin_id, :teacher_id, presence: true
end
