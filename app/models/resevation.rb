class Resevation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_people, presence: true, numericality: true
  
  validate :start_end_check

  def start_end_check
    errors.add(:end_date, "") unless
    self.start_date < self.end_date
  end
  
  mount_uploader :room_image, ImageUploader
end