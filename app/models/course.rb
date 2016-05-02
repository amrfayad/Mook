class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lectures
  mount_uploader :img, CourseImageUploader
end
