class Photo < ApplicationRecord
  belongs_to :gallery
  before_save :increment_photo_num
  # before_destroy :decrement_photo_num

  def increment_photo_num
    self.gallery.num_photos += 1
    self.gallery.save!
  end

  def decrement_photo_num
    self.gallery.num_photos -=1
  end
end
