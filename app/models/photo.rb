class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  has_one_attached :photo 

  validates :photo, presence: true
  scope :persisted, -> { where "id IS NOT NULL" }

 # mount_uploader :photo, PhotoUploader
  # :persisted, -> { where "id IS NOT NULL" }
end
