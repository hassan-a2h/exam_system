class McqAnswer < ApplicationRecord
  belongs_to :result, optional: true
  belongs_to :mcq
end
