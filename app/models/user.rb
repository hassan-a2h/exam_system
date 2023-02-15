# frozen_string_literal: true

class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  default_scope { order(:created_at) }

  validates :name, :email, :type, presence: true

  validates :name, length: { minimum: 3, maximum: 32}

  enum type: {
    Admin: 0,
    Teacher: 1,
    Student: 2
  }
end
