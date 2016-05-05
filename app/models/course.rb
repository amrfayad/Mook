class Course < ActiveRecord::Base
  validates :title, :img, :presence => true
  belongs_to :user
  has_many :lectures
  mount_uploader :img, CourseImageUploader
end
