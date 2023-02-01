# frozen_string_literal: true

class Student < User
  has_one_attached :picture
  has_many :results, dependent: :nullify

  validate :attached_picture
  validate :picture_size

  private

  def attached_picture
    return unless picture.attached?

    extension = picture.filename.to_s.split('.').last
    return if %w[svg eps tiff jpg jpeg png].include?(extension.downcase)

    errors.add(:attachment, 'Invalid Attachment type. (Allowed: png, jpg, svg, eps)')
  end

  def picture_size
    return unless picture.attached?

    return unless picture.attached.byte_size > 2_000_000

    errors.add(:picture, 'File size exceeded (max size: 2MB)')
  end
end
