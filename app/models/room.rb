class Room < ApplicationRecord
  belongs_to :user
  has_many :resevations
  
   validates :room_name, presence: true
   validates :room_introduction, presence: true
   validates :price, presence: true, numericality: true
   validates :address, presence: true
   validates :room_image, presence: true
  
  def self.search(search,keyword)
    if search
      Room.where('address LIKE ?', "%#{search}%")
    elsif keyword
      Room.where(['address LIKE(?) OR room_name LIKE(?) OR room_introduction LIKE(?)', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
    end
  end
  
  mount_uploader :room_image, ImageUploader
end
